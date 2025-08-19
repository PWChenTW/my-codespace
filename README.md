# 🚀 Claude CLI Cloud Workspace

在任何地方使用 Claude CLI - 專為 Windows 用戶設計的雲端開發環境！

## ✨ 特色

- 🐧 **完整 Linux 環境** - 告別 Windows PowerShell 的限制
- 🤖 **預裝 Claude CLI** - 開箱即用，自動配置
- 🎨 **美化終端機** - Zsh + Oh My Zsh + 自動補全
- 🔧 **開發工具齊全** - Node.js, Python, Docker, Git
- 💾 **資料永久保存** - 程式碼和設定都會保留
- 🌐 **瀏覽器即可使用** - 不需要安裝任何軟體

## 🎯 快速開始（3 分鐘）

### 步驟 1: Fork 這個 Repository
點擊右上角的 Fork 按鈕

### 步驟 2: 建立 Codespace
1. 點擊綠色 **Code** 按鈕
2. 選擇 **Codespaces** 標籤
3. 點擊 **Create codespace on main**

### 步驟 3: 等待自動設置（約 2-3 分鐘）
環境會自動：
- 安裝 Claude CLI
- 配置 Zsh 終端機
- 安裝所有開發工具

### 步驟 4: 登入 Claude
```bash
clogin  # 或 claude login
```
輸入你的 API Key（從 [這裡](https://console.anthropic.com/keys) 取得）

### 步驟 5: 開始使用！
```bash
cc  # 或 claude
```

## 📚 使用指南

### 常用命令

| 命令 | 說明 |
|------|------|
| `cc` | 啟動 Claude CLI |
| `clogin` | 登入 Claude |
| `help-claude` | 顯示使用指南 |
| `status` | 查看系統狀態 |
| `mkproject <name>` | 建立新專案 |

### Git 快捷鍵

| 快捷鍵 | 對應命令 |
|--------|----------|
| `gs` | git status |
| `gl` | 漂亮的 git log |
| `gp` | git pull |
| `gpu` | git push |
| `gc "msg"` | git commit -m "msg" |
| `gd` | git diff |

### 工作流程範例

```bash
# 建立新專案
mkproject my-app

# 使用 Claude 開發
cc

# 儲存進度
gc "Add new feature"
gpu

# 從其他電腦繼續
gp
cc
```

## 💡 小技巧

### 1. 設定 Git 使用者
```bash
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
```

### 2. 快速筆記
```bash
note my-idea  # 建立筆記
```

### 3. 清理空間
```bash
cleanup  # 清理暫存檔案
```

### 4. 本地 VS Code 連接
1. 安裝 VS Code
2. 安裝 GitHub Codespaces 擴充套件
3. 從 VS Code 連接到 Codespace（更流暢）

## 📊 免費額度

- **個人帳號**: 60 小時/月（2 核心）
- **Pro 帳號**: 90 小時/月

### 省錢技巧
- ⏸️ 不用時記得**停止**（不是刪除）Codespace
- ⏰ 設定自動停止：Settings → Codespaces → Default idle timeout → 30 分鐘
- 💻 使用 2 核心機器（通常足夠）

## 🆘 常見問題

### Claude CLI 顯示未認證？
```bash
clogin
# 貼上 API Key
```

### Codespace 很慢？
- 升級到 4 核心（Settings → Machine type）
- 清理不需要的檔案 (`cleanup`)

### 想要更多儲存空間？
編輯 `.devcontainer/devcontainer.json`：
```json
"hostRequirements": {
    "storage": "64gb"  // 改成需要的大小
}
```

## 🔗 相關資源

- [Claude API Keys](https://console.anthropic.com/keys)
- [Claude CLI 文檔](https://docs.anthropic.com/claude/docs)
- [GitHub Codespaces 文檔](https://docs.github.com/codespaces)
- [Oh My Zsh 主題](https://github.com/ohmyzsh/ohmyzsh/wiki/Themes)

## 📝 授權

MIT License - 自由使用和修改

---

**Made with ❤️ for Windows users who love Linux**