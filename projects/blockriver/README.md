# BlockRiver - Task Master MCP 使用指南

## 什麼是 Task Master？

Task Master 是一個智能任務管理工具，專為 AI 編程助手設計。它可以幫助您：
- 自動分解複雜的開發任務
- 追蹤項目進度
- 管理任務依賴關係
- 生成詳細的產品需求文檔 (PRD)

## 安裝狀態

✅ Task Master MCP 已成功安裝在此項目中

## 基本使用方法

### 1. 命令行使用

```bash
# 使用完整命令
task-master [命令]

# 使用縮寫別名
tm [命令]
```

### 2. 常用命令

#### 任務管理
```bash
# 查看所有可用命令
tm

# 查看當前任務列表
tm list

# 添加新任務
tm add-task "任務描述"

# 更新任務狀態
tm update-task [任務ID] --status [狀態]

# 查看任務詳情
tm show-task [任務ID]
```

#### PRD (產品需求文檔) 管理
```bash
# 解析 PRD 並生成任務
tm parse-prd scripts/prd.txt

# 分析項目複雜度
tm analyze-complexity

# 展開任務（基於複雜度分析）
tm expand-tasks
```

#### 模型配置
```bash
# 查看當前模型配置
tm models list

# 設置主要模型
tm models set-main [提供商/模型ID]

# 設置研究模型
tm models set-research [提供商/模型ID]
```

### 3. 文件結構

```
.taskmaster/
├── config.json          # 配置文件
├── state.json           # 狀態文件
├── tasks/               # 任務存儲目錄
├── docs/                # 文檔目錄
├── reports/             # 報告目錄
└── templates/           # 模板目錄
    └── example_prd.txt  # PRD 範例模板
```

### 4. MCP 工具集成

當使用 Claude Code 時，Task Master 提供以下 MCP 工具：

- `parse_prd` - 解析產品需求文檔
- `analyze_project_complexity` - 分析項目複雜度
- `add_task` - 添加新任務
- `update_task` - 更新任務狀態
- `list_tasks` - 列出任務
- `expand_tasks` - 展開任務

### 5. 配置 API 密鑰

1. 複製環境變量範例：
```bash
cp .env.example .env
```

2. 編輯 `.env` 文件，添加您的 API 密鑰：
```bash
# Anthropic (Claude)
ANTHROPIC_API_KEY=your_key_here

# OpenAI
OPENAI_API_KEY=your_key_here

# 其他提供商...
```

## BlockRiver 項目工作流程

### 1. 創建 PRD
使用模板創建詳細的產品需求文檔：
```bash
cp .taskmaster/templates/example_prd.txt scripts/prd.txt
# 編輯 scripts/prd.txt 添加覆蓋式期權策略的詳細需求
```

### 2. 生成任務
```bash
# 解析 PRD 並自動生成任務
tm parse-prd scripts/prd.txt

# 分析任務複雜度
tm analyze-complexity

# 基於複雜度分析展開任務
tm expand-tasks
```

### 3. 執行開發
```bash
# 查看下一個要執行的任務
tm list --status pending

# 開始工作時更新任務狀態
tm update-task [任務ID] --status in-progress

# 完成後標記為完成
tm update-task [任務ID] --status completed
```

### 4. 追蹤進度
```bash
# 查看項目整體進度
tm progress

# 生成進度報告
tm report
```

## 加密貨幣覆蓋式期權策略特定配置

對於 BlockRiver 項目，建議的配置：

### 主要模型（代碼生成）
```bash
tm models set-main claude-code/opus
```

### 研究模型（市場分析）
```bash
tm models set-research perplexity/sonar-pro
```

## 最佳實踐

1. **結構化開發**：始終從 PRD 開始，讓 Task Master 生成結構化的任務列表
2. **增量實施**：使用任務狀態追蹤，確保每個組件都經過完整測試
3. **依賴管理**：讓 Task Master 管理任務之間的依賴關係
4. **定期檢查**：使用進度報告追蹤項目狀態

## 故障排除

### 常見問題

1. **命令找不到**：運行 `source ~/.zshrc` 重新加載別名
2. **API 密鑰錯誤**：檢查 `.env` 文件中的密鑰配置
3. **任務解析失敗**：確保 PRD 文件格式正確

### 獲取幫助
```bash
# 查看幫助文檔
tm --help

# 查看特定命令幫助
tm [命令] --help
```

## 下一步

1. 創建覆蓋式期權策略的詳細 PRD
2. 使用 Task Master 解析並生成開發任務
3. 開始實施核心功能模組

---

*此文檔為 BlockRiver 加密貨幣覆蓋式期權策略項目的 Task Master 使用指南*
<!-- TASKMASTER_EXPORT_START -->
> 🎯 **Taskmaster Export** - 2025-08-22 06:19:13 UTC
> 📋 Export: with subtasks • Status filter: none
> 🔗 Powered by [Task Master](https://task-master.dev?utm_source=github-readme&utm_medium=readme-export&utm_campaign=blockriver&utm_content=task-export-link)

| Project Dashboard |  |
| :-                |:-|
| Task Progress     | ░░░░░░░░░░░░░░░░░░░░ 0% |
| Done | 0 |
| In Progress | 0 |
| Pending | 3 |
| Deferred | 0 |
| Cancelled | 0 |
|-|-|
| Subtask Progress | ░░░░░░░░░░░░░░░░░░░░ 0% |
| Completed | 0 |
| In Progress | 0 |
| Pending | 8 |


| ID | Title | Status | Priority | Dependencies | Complexity |
| :- | :-    | :-     | :-       | :-           | :-         |
| 1 | Hour 1: Environment Setup + BTC Data Acquisition | ○&nbsp;pending | high | None | N/A |
| 1.1 | Quick Node.js/TypeScript project setup (10min) | ○&nbsp;pending | -            | None | N/A |
| 1.2 | Implement Binance API client (20min) | ○&nbsp;pending | -            | None | N/A |
| 1.3 | Download 2-year BTC historical data (30min) | ○&nbsp;pending | -            | None | N/A |
| 2 | Hour 2: Deribit Options Data Acquisition | ○&nbsp;pending | high | 1 | N/A |
| 2.1 | Implement Deribit API client (20min) | ○&nbsp;pending | -            | None | N/A |
| 2.2 | Acquire historical options data (40min) | ○&nbsp;pending | -            | None | N/A |
| 3 | Hour 3: Strategy Implementation + Backtesting | ○&nbsp;pending | high | 1, 2 | N/A |
| 3.1 | Implement Covered Call strategy logic (20min) | ○&nbsp;pending | -            | None | N/A |
| 3.2 | Build simple backtesting engine (25min) | ○&nbsp;pending | -            | None | N/A |
| 3.3 | Generate results visualization (15min) | ○&nbsp;pending | -            | None | N/A |

> 📋 **End of Taskmaster Export** - Tasks are synced from your project using the `sync-readme` command.
<!-- TASKMASTER_EXPORT_END -->
