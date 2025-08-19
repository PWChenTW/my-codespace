#!/bin/bash
set -e

echo "🚀 Setting up Claude CLI Cloud Workspace..."

# Install Oh My Zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "📦 Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

# Configure Zsh
echo "⚙️ Configuring Zsh..."
cat > ~/.zshrc << 'EOF'
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="agnoster"

plugins=(
    git
    npm
    node
    python
    docker
    zsh-autosuggestions
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# Aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias gs='git status'
alias gp='git pull'
alias gpu='git push'
alias gc='git commit -m'
alias gca='git commit -am'
alias gco='git checkout'
alias gb='git branch'
alias gl='git log --oneline --graph --decorate --all'
alias gd='git diff'
alias gds='git diff --staged'

# Claude CLI shortcuts
alias cc='claude'
alias ccode='claude-code'
alias clogin='claude login'

# Directory navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias ~='cd ~'
alias -- -='cd -'

# Development shortcuts
alias npmi='npm install'
alias npms='npm start'
alias npmt='npm test'
alias npmr='npm run'

# Python shortcuts
alias py='python3'
alias pip='pip3'
alias venv='python3 -m venv .venv'
alias activate='source .venv/bin/activate'

# Docker shortcuts
alias dps='docker ps'
alias dpsa='docker ps -a'
alias di='docker images'
alias dex='docker exec -it'
alias dlog='docker logs'
alias dstop='docker stop'
alias drm='docker rm'
alias dprune='docker system prune -a'

# Color support
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# Node.js memory
export NODE_OPTIONS="--max-old-space-size=4096"

# Better history
HISTSIZE=10000
SAVEHIST=10000
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE

# Auto-suggestions configuration
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#666666"
ZSH_AUTOSUGGEST_STRATEGY=(history completion)

# Welcome message
echo "🎉 Claude CLI Cloud Workspace Ready!"
echo "💡 Quick commands: 'cc' for claude, 'clogin' to authenticate"
echo "📝 Type 'help-claude' for usage guide"
EOF

# Install Zsh plugins
echo "📦 Installing Zsh plugins..."
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions 2>/dev/null || true
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting 2>/dev/null || true

# Install Claude CLI
echo "📦 Installing Claude CLI..."
npm install -g @anthropic-ai/claude-code

# Install other useful tools
echo "📦 Installing development tools..."
npm install -g prettier eslint typescript nodemon pm2 serve http-server

# Install Python packages
echo "📦 Installing Python packages..."
pip install --user requests pandas numpy matplotlib jupyter ipython black flake8 pytest rich typer

# Create help command
cat > /usr/local/bin/help-claude << 'HELP'
#!/bin/bash
cat << EOF
🤖 Claude CLI Cloud Workspace - Quick Guide
===========================================

CLAUDE COMMANDS:
  cc / claude      - Start Claude CLI
  clogin          - Login to Claude (need API key)
  claude help     - Show Claude help

GIT SHORTCUTS:
  gs    - git status
  gl    - pretty git log
  gp    - git pull
  gpu   - git push
  gc    - git commit
  gd    - git diff

NAVIGATION:
  ..    - go up one directory
  ...   - go up two directories
  ~     - go to home
  -     - go to previous directory

DEVELOPMENT:
  npmi  - npm install
  npms  - npm start
  py    - python3
  venv  - create virtual environment
  
USEFUL FUNCTIONS:
  mkproject <name>  - Create new project
  cleanup          - Clean temporary files
  status           - Show system status

Need API Key? Visit: https://console.anthropic.com/keys
Documentation: https://docs.anthropic.com/claude/docs
EOF
HELP
chmod +x /usr/local/bin/help-claude

# Create utility functions
cat >> ~/.zshrc << 'FUNCTIONS'

# Create new project
mkproject() {
    if [ -z "$1" ]; then
        echo "Usage: mkproject <project-name>"
        return 1
    fi
    mkdir -p ~/projects/$1
    cd ~/projects/$1
    git init
    echo "# $1" > README.md
    echo "node_modules/\n.env\n*.log\n.DS_Store" > .gitignore
    echo "✅ Project created: ~/projects/$1"
}

# System status
status() {
    echo "📊 System Status"
    echo "=================="
    echo "💾 Disk: $(df -h / | awk 'NR==2 {print $3 " / " $2 " (" $5 ")"}')"
    echo "🧠 Memory: $(free -h | awk 'NR==2 {print $3 " / " $2}')"
    echo "⏱️  Uptime: $(uptime -p)"
    echo "🤖 Claude CLI: $(command -v claude > /dev/null && echo '✅ Installed' || echo '❌ Not installed')"
    echo "📦 Node: $(node --version)"
    echo "🐍 Python: $(python3 --version | cut -d' ' -f2)"
}

# Cleanup temporary files
cleanup() {
    echo "🧹 Cleaning up..."
    find . -name "*.pyc" -delete
    find . -name "__pycache__" -type d -delete
    find . -name ".DS_Store" -delete
    npm cache clean --force 2>/dev/null || true
    echo "✅ Cleanup complete!"
}

# Quick note
note() {
    mkdir -p ~/notes
    if [ -z "$1" ]; then
        vi ~/notes/$(date +%Y%m%d-%H%M%S).md
    else
        vi ~/notes/$(date +%Y%m%d)-$1.md
    fi
}
FUNCTIONS

# Configure Git
echo "⚙️ Configuring Git defaults..."
git config --global init.defaultBranch main
git config --global pull.rebase false
git config --global core.autocrlf input
git config --global core.editor "code --wait"

# Create project structure
echo "📁 Creating project directories..."
mkdir -p ~/projects/{work,personal,experiments}
mkdir -p ~/scripts
mkdir -p ~/notes
mkdir -p ~/.config

echo "✅ Setup complete!"