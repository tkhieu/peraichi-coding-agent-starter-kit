#!/bin/bash
set -euo pipefail

# map.sh - Symlink working folder subdirectories to project root
# Usage: ./map.sh <working_folder> [--dry-run] [--unmap]
#
# Symlinks all subdirectories from working_folder to project root.
# Hidden dirs and files are always skipped.
# Existing items at root are not overwritten.

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd -P)"
DRY_RUN=false
UNMAP=false

usage() {
    echo "Usage: $0 <working_folder> [--dry-run] [--unmap]"
    echo ""
    echo "Options:"
    echo "  --dry-run  Preview without making changes"
    echo "  --unmap    Remove symlinks pointing to working_folder"
    echo ""
    echo "Symlinks all subdirectories from working_folder to project root."
    echo "Hidden dirs and files are skipped. Existing items are not overwritten."
    exit 1
}

[[ $# -lt 1 ]] && usage

WORKING_FOLDER=""
for arg in "$@"; do
    case $arg in
        --dry-run) DRY_RUN=true ;;
        --unmap) UNMAP=true ;;
        -h|--help) usage ;;
        -*) echo "Unknown option: $arg"; usage ;;
        *) WORKING_FOLDER="$arg" ;;
    esac
done

[[ -z "$WORKING_FOLDER" ]] && usage

# Resolve to absolute path
if [[ -d "$WORKING_FOLDER" ]]; then
    WORKING_FOLDER="$(cd "$WORKING_FOLDER" && pwd -P)"
else
    echo "Error: '$WORKING_FOLDER' is not a directory"
    exit 1
fi

# Unmap mode: remove symlinks pointing to working folder
if [[ "$UNMAP" == "true" ]]; then
    echo "Unmapping symlinks from: $WORKING_FOLDER"
    echo "Project root: $SCRIPT_DIR"
    echo ""

    REMOVED=0
    shopt -s nullglob

    for link in "$SCRIPT_DIR"/*; do
        [[ ! -L "$link" ]] && continue

        target="$(readlink "$link")"
        if [[ "$target" == "$WORKING_FOLDER"* ]]; then
            name="$(basename "$link")"
            if [[ "$DRY_RUN" == "true" ]]; then
                echo "Would remove: $name"
            else
                rm -f "$link"
                echo "Removed: $name"
            fi
            ((REMOVED++)) || true
        fi
    done

    echo ""
    echo "Summary: $REMOVED symlink(s) removed"
    [[ "$DRY_RUN" == "true" ]] && echo "(dry-run mode - no changes made)"
    exit 0
fi

# Map mode: create symlinks
echo "Mapping from: $WORKING_FOLDER"
echo "Mapping to:   $SCRIPT_DIR"
echo ""

shopt -s nullglob

CREATED=0
SKIPPED=0

for source in "$WORKING_FOLDER"/*; do
    name="$(basename "$source")"
    target="$SCRIPT_DIR/$name"

    # Skip hidden
    [[ "$name" == .* ]] && continue

    # Skip non-directories
    [[ ! -d "$source" ]] && continue

    # Check existing - skip and warn
    if [[ -e "$target" || -L "$target" ]]; then
        echo "Skip: $name (already exists)"
        ((SKIPPED++)) || true
        continue
    fi

    # Create symlink
    if [[ "$DRY_RUN" == "true" ]]; then
        echo "Would link: $name"
    else
        ln -s "$source" "$target"
        echo "Linked: $name"
    fi
    ((CREATED++)) || true
done

echo ""
echo "Summary: $CREATED linked, $SKIPPED skipped"
[[ "$DRY_RUN" == "true" ]] && echo "(dry-run mode - no changes made)"
