# BlockRiver - Crypto Covered Call Strategy

## Project Overview
BlockRiver is a cryptocurrency trading system that implements covered call strategies for generating income from crypto holdings.

## Covered Call Strategy
A covered call strategy involves:
1. Holding cryptocurrency assets (long position)
2. Selling call options on those assets to collect premium
3. Managing risk through position sizing and strike price selection
4. Automating the process for consistent income generation

## Development Commands
- **Test**: `npm test` (to be determined based on chosen framework)
- **Build**: `npm run build` (to be determined)
- **Lint**: `npm run lint` (to be determined)
- **Type Check**: `npm run typecheck` (to be determined)

## Key Components (Planned)
- Market data integration for crypto exchanges
- Options pricing and Greeks calculation
- Position management and tracking
- Risk management and alerts
- Automated strategy execution
- Portfolio analytics and reporting

## Technology Stack (To Be Determined)
- Programming Language: TypeScript/JavaScript (likely)
- Market Data: Exchange APIs (Binance, Coinbase, etc.)
- Options Data: Deribit or similar
- Database: TBD
- Testing Framework: TBD

## Risk Management Features
- Position sizing limits
- Stop-loss mechanisms
- Volatility monitoring
- Correlation analysis
- Portfolio exposure limits

## Security Considerations
- API key management
- Trade execution validation
- Audit trail maintenance
- Error handling and recovery

## MCP (Model Context Protocol) 整合

### Serena MCP
語義代碼檢索和編輯工具，提供智慧代碼分析功能。

**啟動指令**:
```bash
uvx --from git+https://github.com/oraios/serena serena start-mcp-server --project /workspaces/my-codespace/projects/blockriver
```

**使用規範**:
- 用於代碼檢索、語義分析和重構
- 建議在大型重構前先建立專案索引: `serena project index`
- 支援多語言語義理解，適合複雜代碼結構分析
- 詳細使用說明請參考: `SerenaMCP_README.md`

### Task Master MCP
任務管理和工作流程自動化工具。

**使用規範**:
- 用於管理開發任務、追蹤進度和自動化工作流程
- 適合複雜專案的任務分解和進度追蹤
- 支援與 CI/CD 流程整合

## Claude Code Hooks 配置

### Pre-commit Hook
```bash
# 在提交前自動執行代碼檢查
npm run lint && npm run typecheck && npm test
```

### Post-code-generation Hook
```bash
# 代碼生成後自動格式化和檢查
npm run format && npm run lint:fix
```

### Build Validation Hook
```bash
# 構建驗證
npm run build && echo "Build successful"
```

### Trading Strategy Validation Hook
```bash
# 交易策略驗證（防禦性檢查）
echo "Validating trading strategy implementation for defensive purposes only"
```

## 開發工作流程

1. **代碼分析**: 使用 Serena MCP 進行語義分析
2. **任務管理**: 使用 Task Master MCP 追蹤開發進度
3. **代碼檢查**: 透過 hooks 自動執行品質檢查
4. **安全驗證**: 確保所有交易邏輯符合防禦性策略要求

---
*Generated for defensive trading strategy implementation*

## Task Master AI Instructions
**Import Task Master's development workflow commands and guidelines, treat as if import is in the main CLAUDE.md file.**
@./.taskmaster/CLAUDE.md
