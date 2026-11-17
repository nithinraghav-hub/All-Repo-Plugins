#!/usr/bin/env python3
"""PreToolUse hook: ask before changing or deleting brand image files.

Protected files are the images at the repository root (logos, mascot,
favicons, prompt images). Any tool call that would overwrite, move or
delete one of them is held for the user's confirmation instead of running
automatically. Everything else passes through untouched.
"""

import json
import os
import re
import shlex
import sys

IMAGE_EXTS = (".png", ".svg", ".jpg", ".jpeg", ".webp", ".gif")


def project_dir():
    return os.path.realpath(os.environ.get("CLAUDE_PROJECT_DIR") or os.getcwd())


def protected_files(root):
    try:
        names = os.listdir(root)
    except OSError:
        return []
    return sorted(
        n for n in names
        if n.lower().endswith(IMAGE_EXTS) and os.path.isfile(os.path.join(root, n))
    )


def ask(reason):
    print(json.dumps({
        "hookSpecificOutput": {
            "hookEventName": "PreToolUse",
            "permissionDecision": "ask",
            "permissionDecisionReason": reason,
        }
    }))
    sys.exit(0)


def check_file_tool(tool_input, root, protected):
    path = tool_input.get("file_path") or tool_input.get("notebook_path") or ""
    if not path:
        return
    full = os.path.realpath(path if os.path.isabs(path) else os.path.join(root, path))
    if os.path.dirname(full) == root and os.path.basename(full) in protected:
        ask(f"'{os.path.basename(full)}' is a protected ToyGenie brand file. "
            "Confirm only if you meant to change it.")


# Commands that can delete, move or overwrite files.
DESTRUCTIVE = re.compile(
    r"(^|[\s;&|(`])("
    r"rm|mv|cp|unlink|shred|truncate|tee|dd|install|rsync|"
    r"sed\s+(-[a-zA-Z]*\s+)*-i|perl\s+-[a-zA-Z]*i|"
    r"convert|magick|mogrify|"
    r"git\s+(rm|mv|clean|restore|checkout|reset|stash|rebase|merge|pull|switch)"
    r")\b"
    r"|>"  # shell redirection
)

# Patterns that hit every root image without naming one.
BROAD = re.compile(
    r"\*\.(png|svg|jpe?g|webp|gif)\b"   # *.png
    r"|(^|\s)(\./)?\*(\s|$)"            # * or ./*
    r"|git\s+(rm\s+-r\s+\.|clean|reset\s+--hard)",
    re.IGNORECASE,
)


COPY_VERBS = {"cp", "rsync", "install"}


def only_copy_source(command, name):
    """True when every mention of `name` is as the source of a cp/rsync/install,
    which reads the file but leaves it unchanged (e.g. `cp logo.png web/`)."""
    try:
        segments = re.split(r"&&|\|\||[;|&\n]", command)
        found = False
        for seg in segments:
            tokens = shlex.split(seg)
            if name not in tokens:
                continue
            found = True
            if ">" in seg or not tokens or tokens[0] not in COPY_VERBS:
                return False
            if tokens[-1] == name:  # destination
                return False
        return found
    except ValueError:
        return False


def check_bash(tool_input, protected):
    command = tool_input.get("command") or ""
    if not DESTRUCTIVE.search(command):
        return
    # Undo shell quoting and escaped spaces so names like
    # "Genie AI_Toygenie Mascot_Transparent.png" still match.
    flat = re.sub(r"\\(.)", r"\1", command).replace('"', "").replace("'", "")
    hits = [n for n in protected if n in flat and not only_copy_source(command, n)]
    if hits:
        ask("This command may modify or delete protected ToyGenie brand file(s): "
            + ", ".join(hits) + ". Confirm only if you meant to.")
    if BROAD.search(flat):
        ask("This command may modify or delete the protected ToyGenie brand files "
            "at the repo root. Confirm only if you meant to.")


def main():
    try:
        data = json.load(sys.stdin)
    except (ValueError, OSError):
        return
    tool = data.get("tool_name", "")
    tool_input = data.get("tool_input") or {}
    root = project_dir()
    protected = protected_files(root)
    if not protected:
        return
    if tool in ("Write", "Edit", "MultiEdit", "NotebookEdit"):
        check_file_tool(tool_input, root, protected)
    elif tool == "Bash":
        check_bash(tool_input, protected)


if __name__ == "__main__":
    main()
