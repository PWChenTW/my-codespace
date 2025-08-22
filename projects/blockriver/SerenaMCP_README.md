# Serena MCP 使用說明

## 簡介
Serena MCP 是一個語義代碼檢索和編輯工具，支援多種程式語言並與各種編碼助手（如 Claude、Codex 和 Gemini）相容。

## 系統需求
- Python 3.x
- uv 套件管理器

## 安裝步驟

### 1. 安裝 uv 套件管理器
```bash
curl -LsSf https://astral.sh/uv/install.sh | sh
export PATH="$HOME/.local/bin:$PATH"
```

### 2. 安裝 Serena MCP
有三種安裝方式：

#### 方式一：使用 uvx（推薦）
```bash
uvx --from git+https://github.com/oraios/serena serena start-mcp-server
```

#### 方式二：本地安裝
```bash
git clone https://github.com/oraios/serena
cd serena
uv run serena start-mcp-server
```

#### 方式三：使用 Docker（實驗性）
```bash
docker run --rm -i --network host \
  -v /path/to/your/projects:/workspaces/projects \
  ghcr.io/oraios/serena:latest \
  serena start-mcp-server --transport stdio
```

## 基本使用

### 啟動 MCP 伺服器
```bash
# 基本啟動
uvx --from git+https://github.com/oraios/serena serena start-mcp-server

# 指定專案啟動
uvx --from git+https://github.com/oraios/serena serena start-mcp-server --project /workspaces/my-codespace/projects/blockriver

# 使用不同傳輸協定
uvx --from git+https://github.com/oraios/serena serena start-mcp-server --transport sse --port 8000
```

### 專案管理
```bash
# 啟動時激活專案
serena start-mcp-server --project /path/to/your/project

# 對於大型專案，建議先建立索引
serena project index
```

## 配置選項

### 常用參數
- `--project`: 指定專案路徑或名稱
- `--context`: 內建上下文名稱或自定義上下文 YAML 路徑（預設：desktop-app）
- `--mode`: 內建模式名稱或自定義模式 YAML 路徑（預設：interactive, editing）
- `--transport`: 傳輸協定（stdio 或 sse，預設：stdio）
- `--host`: 主機位址（預設：0.0.0.0）
- `--port`: 連接埠（預設：8000）
- `--log-level`: 日誌級別（DEBUG|INFO|WARNING|ERROR|CRITICAL）

### 範例配置
```bash
# 以除錯模式啟動，啟用網頁儀表板
uvx --from git+https://github.com/oraios/serena serena start-mcp-server \
  --project /workspaces/my-codespace/projects/blockriver \
  --log-level DEBUG \
  --enable-web-dashboard true \
  --transport sse \
  --port 8080
```

## BlockRiver 專案整合

### 1. 為 BlockRiver 專案啟動 Serena
```bash
cd /workspaces/my-codespace/projects/blockriver
uvx --from git+https://github.com/oraios/serena serena start-mcp-server --project .
```

### 2. 建立專案索引（推薦）
```bash
serena project index
```

### 3. 常見使用情境
- **代碼檢索**: 快速查找函數、類別或變數定義
- **語義編輯**: 基於語義理解進行代碼修改
- **專案分析**: 理解專案結構和依賴關係
- **重構支援**: 安全地重新命名和重構代碼

## 疑難排解

### 常見問題
1. **找不到 uv 命令**
   ```bash
   export PATH="$HOME/.local/bin:$PATH"
   ```

2. **Python 版本不相容**
   確保使用 Python 3.x：
   ```bash
   python3 --version
   ```

3. **權限問題**
   確保有寫入權限：
   ```bash
   chmod +x ~/.local/bin/uv
   ```

### 日誌檢查
```bash
# 啟用詳細日誌
serena start-mcp-server --log-level DEBUG
```

## 進階功能

### 自定義配置
可以通過 YAML 檔案自定義上下文和模式：
```bash
serena start-mcp-server --context /path/to/custom-context.yaml --mode /path/to/custom-mode.yaml
```

### 與 IDE 整合
Serena MCP 可以與多種開發環境整合：
- Claude Code
- Claude Desktop
- 終端機客戶端
- IDE 擴展

## 相關連結
- [Serena GitHub Repository](https://github.com/oraios/serena)
- [uv 安裝指南](https://astral.sh/uv/)

---
*本文件為 BlockRiver 專案的 Serena MCP 使用指南*