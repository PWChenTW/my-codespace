#!/bin/bash

echo "🔄 Starting Claude CLI Workspace..."

# Check Claude CLI
if command -v claude > /dev/null; then
    if ! claude auth status 2>/dev/null | grep -q "Authenticated"; then
        echo "⚠️  Claude CLI not authenticated"
        echo "📝 Run: clogin"
        echo "🔑 Get key: https://console.anthropic.com/keys"
    else
        echo "✅ Claude CLI ready"
    fi
else
    echo "⚠️  Installing Claude CLI..."
    npm install -g @anthropic-ai/claude-code
fi

echo ""
echo "💡 Commands:"
echo "  cc      - Start Claude"
echo "  clogin  - Authenticate"
echo "  status  - System info"