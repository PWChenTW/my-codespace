#!/bin/bash
set -e

echo "🚀 Setting up Claude CLI Lightweight Workspace..."

# Configure Zsh (Oh My Zsh already installed by devcontainer feature)
echo "⚙️ Configuring shell environment..."
cat > ~/.zshrc << 'EOF'
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"

plugins=(git npm node)

source $ZSH/oh-my-zsh.sh

# Aliases
alias ll='ls -alF'
alias gs='git status'
alias gp='git pull'
alias gpu='git push'
alias gc='git commit -m'
alias gl='git log --oneline --graph --all'

# Claude CLI shortcuts
alias cc='claude'
alias clogin='claude login'

# Directory shortcuts
alias ..='cd ..'
alias ...='cd ../..'

# Colors
export CLICOLOR=1

# Node.js
export NODE_OPTIONS="--max-old-space-size=2048"

# Functions
mkproject() {
    if [ -z "$1" ]; then
        echo "Usage: mkproject <name>"
        return 1
    fi
    mkdir -p ~/projects/$1
    cd ~/projects/$1
    git init
    echo "# $1" > README.md
    echo "✅ Created project: ~/projects/$1"
}

status() {
    echo "📊 System Status"
    echo "================"
    echo "Node: $(node --version 2>/dev/null || echo 'Not installed')"
    echo "NPM: $(npm --version 2>/dev/null || echo 'Not installed')"
    echo "Claude CLI: $(command -v claude > /dev/null && echo '✅ Installed' || echo '❌ Not installed')"
    echo ""
    if git rev-parse --git-dir > /dev/null 2>&1; then
        echo "Git: $(git branch --show-current)"
    fi
}

echo "🎉 Claude CLI Workspace Ready!"
echo "💡 Run 'clogin' to authenticate Claude"
EOF

# Install Claude CLI
echo "📦 Installing Claude CLI..."
npm install -g @anthropic-ai/claude-code

# Install basic tools
echo "📦 Installing essential tools..."
npm install -g prettier

# Configure Git
echo "⚙️ Configuring Git..."
git config --global init.defaultBranch main
git config --global pull.rebase false

# Create directories
echo "📁 Creating project structure..."
mkdir -p ~/projects
mkdir -p ~/notes

echo "✅ Setup complete!"
echo "📝 Run 'clogin' to authenticate with your API key"