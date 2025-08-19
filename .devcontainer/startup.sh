#!/bin/bash

echo "🔄 Starting Claude CLI Cloud Workspace..."
echo ""

# Check Claude CLI authentication
if command -v claude > /dev/null; then
    if ! claude auth status 2>/dev/null | grep -q "Authenticated"; then
        echo "⚠️  Claude CLI not authenticated"
        echo "📝 Run: clogin (or claude login)"
        echo "🔑 Get API key: https://console.anthropic.com/keys"
    else
        echo "✅ Claude CLI authenticated"
    fi
else
    echo "⚠️  Claude CLI not installed"
    echo "📝 Run: npm install -g @anthropic-ai/claude-code"
fi

echo ""
echo "💡 Quick tips:"
echo "   • Type 'cc' to start Claude"
echo "   • Type 'help-claude' for guide"
echo "   • Type 'status' for system info"
echo ""

# Show git status if in repo
if git rev-parse --git-dir > /dev/null 2>&1; then
    echo "📁 Current repository:"
    git status -sb
fi