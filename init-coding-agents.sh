#!/bin/bash
# init-coding-agents.sh - Check and install dependencies for Claude Code skills
# Usage: ./init-coding-agents.sh [--install]

# Don't exit on error for checks
set +e

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

INSTALL_MODE=false
if [[ "$1" == "--install" ]]; then
    INSTALL_MODE=true
fi

echo "=========================================="
echo "Claude Code Skills - Dependency Checker"
echo "=========================================="
echo ""

# Track missing dependencies
MISSING_REQUIRED=()
MISSING_OPTIONAL=()

# Detect OS
OS="unknown"
if [[ "$OSTYPE" == "darwin"* ]]; then
    OS="macos"
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    OS="linux"
elif [[ "$OSTYPE" == "msys" ]] || [[ "$OSTYPE" == "cygwin" ]]; then
    OS="windows"
fi

check_command() {
    local cmd=$1
    local name=$2
    local required=$3

    if command -v "$cmd" &> /dev/null; then
        version=$($cmd --version 2>/dev/null | head -1 || echo "installed")
        echo -e "${GREEN}✓${NC} $name: $version"
        return 0
    else
        if [[ "$required" == "required" ]]; then
            echo -e "${RED}✗${NC} $name: NOT FOUND (required)"
            MISSING_REQUIRED+=("$name")
        else
            echo -e "${YELLOW}○${NC} $name: NOT FOUND (optional)"
            MISSING_OPTIONAL+=("$name")
        fi
        return 1
    fi
}

check_python_package() {
    local pkg=$1
    local required=$2

    if python3 -c "import $pkg" &> /dev/null; then
        echo -e "${GREEN}✓${NC} Python: $pkg"
        return 0
    else
        if [[ "$required" == "required" ]]; then
            echo -e "${RED}✗${NC} Python: $pkg (required)"
            MISSING_REQUIRED+=("pip:$pkg")
        else
            echo -e "${YELLOW}○${NC} Python: $pkg (optional)"
            MISSING_OPTIONAL+=("pip:$pkg")
        fi
        return 1
    fi
}

echo "== System Dependencies =="
check_command "node" "Node.js" "required"
check_command "python3" "Python 3" "required"
check_command "ffmpeg" "FFmpeg" "optional"
check_command "convert" "ImageMagick" "optional"
check_command "rmbg" "RMBG CLI" "optional"

echo ""
echo "== Claude-Flow (Multi-Agent Orchestration) =="
check_command "claude-flow" "Claude-Flow" "optional"

echo ""
echo "== Python Packages (ai-multimodal skill) =="
check_python_package "google.genai" "optional"
check_python_package "pypdf" "optional"
check_python_package "docx" "optional"
check_python_package "markdown" "optional"
check_python_package "PIL" "optional"
check_python_package "dotenv" "optional"

echo ""
echo "== Environment Variables =="
if [[ -n "$GEMINI_API_KEY" ]]; then
    echo -e "${GREEN}✓${NC} GEMINI_API_KEY: configured"
else
    echo -e "${YELLOW}○${NC} GEMINI_API_KEY: not set (needed for ai-multimodal)"
fi

echo ""
echo "=========================================="

# Summary
if [[ ${#MISSING_REQUIRED[@]} -gt 0 ]]; then
    echo -e "${RED}Missing required dependencies:${NC}"
    printf '  - %s\n' "${MISSING_REQUIRED[@]}"
    echo ""
fi

if [[ ${#MISSING_OPTIONAL[@]} -gt 0 ]]; then
    echo -e "${YELLOW}Missing optional dependencies:${NC}"
    printf '  - %s\n' "${MISSING_OPTIONAL[@]}"
    echo ""
fi

# Install mode
if [[ "$INSTALL_MODE" == true ]]; then
    echo "== Installing Dependencies =="

    # System packages
    if [[ "$OS" == "macos" ]]; then
        if ! command -v brew &> /dev/null; then
            echo "Homebrew not found. Please install: https://brew.sh"
        else
            echo "Installing system dependencies via Homebrew..."
            brew install node python ffmpeg imagemagick 2>/dev/null || true
        fi

        # NPM packages
        if command -v npm &> /dev/null; then
            echo "Installing rmbg-cli..."
            npm install -g rmbg-cli 2>/dev/null || true
            echo "Installing claude-flow..."
            npm install -g claude-flow@alpha 2>/dev/null || true
        fi

    elif [[ "$OS" == "linux" ]]; then
        echo "Installing system dependencies via apt..."
        sudo apt-get update
        sudo apt-get install -y nodejs npm python3 python3-pip ffmpeg imagemagick

        # NPM packages
        sudo npm install -g rmbg-cli 2>/dev/null || true
        sudo npm install -g claude-flow@alpha 2>/dev/null || true
    fi

    # Python packages
    echo "Installing Python packages..."
    pip3 install google-genai pypdf python-docx markdown Pillow python-dotenv 2>/dev/null || true

    echo ""
    echo -e "${GREEN}Installation complete!${NC}"
    echo "Re-run without --install to verify."
else
    if [[ ${#MISSING_REQUIRED[@]} -gt 0 ]] || [[ ${#MISSING_OPTIONAL[@]} -gt 0 ]]; then
        echo "Run with --install to auto-install missing dependencies:"
        echo "  ./init-coding-agents.sh --install"
    else
        echo -e "${GREEN}All dependencies satisfied!${NC}"
    fi
fi
