# BlockRiver MVP - 3小時實作計畫 PRD

## 專案概述
在3小時內實作一個最簡可行產品（MVP），展示使用真實市場數據的 BTC Covered Call 策略回測系統。

## 目標
證明概念：使用真實的 BTC 價格數據和 Deribit 期權歷史數據，實現並回測 Covered Call 策略的可行性。

## 時間分配

### 第1小時：環境設置 + BTC 數據獲取
- **10分鐘**：快速 Node.js/TypeScript 專案設置
- **20分鐘**：實現 Binance API 客戶端（公開端點）
- **30分鐘**：下載並儲存2年 BTC 日線數據

### 第2小時：Deribit 期權數據獲取
- **20分鐘**：實現 Deribit API 客戶端
- **40分鐘**：獲取歷史期權數據（每週五到期 ATM 期權）

### 第3小時：策略實現 + 回測
- **20分鐘**：實現 Covered Call 策略邏輯
- **25分鐘**：建立簡易回測引擎
- **15分鐘**：生成結果視覺化

## 技術規格

### 最小化依賴
```json
{
  "dependencies": {
    "axios": "^1.6.0",
    "dotenv": "^16.3.0",
    "csv-parser": "^3.0.0",
    "csv-writer": "^1.6.0"
  },
  "devDependencies": {
    "typescript": "^5.0.0",
    "@types/node": "^20.0.0",
    "ts-node": "^10.9.0"
  }
}
```

### 專案結構
```
src/
├── api/
│   ├── binance.ts          # Binance 公開 API 客戶端
│   └── deribit.ts          # Deribit 歷史數據 API 客戶端
├── data/
│   ├── btc-prices.csv      # BTC 歷史價格數據
│   └── options-data.csv    # 期權歷史數據
├── strategy/
│   └── covered-call.ts     # Covered Call 策略實現
├── backtest/
│   └── engine.ts           # 簡易回測引擎
├── utils/
│   └── visualization.ts    # 結果視覺化
└── index.ts                # 主程式入口
```

## API 端點

### Binance API（公開端點，無需認證）
- `GET /api/v3/klines` - 獲取 K線數據
- 參數：symbol=BTCUSDT, interval=1d, limit=1000

### Deribit API（公開端點，無需認證）
- `GET /api/v2/public/get_tradingview_chart_data` - 獲取歷史價格圖表數據
- `GET /api/v2/public/get_historical_volatility` - 獲取歷史波動率
- 重點：BTC 期權到期日通常為每週五

## 策略規則（極簡版）

### Covered Call 策略
1. **持有標的**：始終持有1 BTC
2. **賣出期權**：每週五賣出下週到期的 ATM Call Option
3. **到期處理**：
   - 若 BTC 價格 < 執行價：期權到期無價值，保留權利金
   - 若 BTC 價格 > 執行價：被執行，以執行價賣出 BTC

### 簡化假設
- 不考慮交易手續費和滑點
- 不考慮提前平倉
- 假設總是能以市價成交
- 使用 Deribit 歷史成交價作為期權價格

## 數據格式

### BTC 價格數據 (CSV)
```csv
date,open,high,low,close,volume
2023-01-01,16541.2,16600.5,16520.1,16580.3,1234567
```

### 期權數據 (CSV)
```csv
date,strike_price,option_price,implied_volatility,days_to_expiry
2023-01-06,16500,250.5,0.65,7
```

## 輸出結果

### 績效指標
- 總報酬率
- 年化報酬率
- 夏普比率
- 最大回撤
- 勝率（盈利週數比例）

### 視覺化
- 策略淨值 vs BTC 持有淨值對比圖
- 週收益分布圖
- 回撤曲線

## 成功標準
1. 成功獲取2年真實 BTC 價格數據
2. 成功獲取期權歷史數據
3. 完成 Covered Call 策略回測
4. 生成策略績效報告
5. 與單純持有 BTC 的績效對比

## 風險和限制
- MVP 階段不考慮流動性風險
- 期權數據可能不完整
- 簡化的定價模型可能不夠精確
- 不包含風險管理機制

## 後續擴展方向
- 動態執行價選擇策略
- 多種期權策略組合
- 完整的風險管理系統
- 實時交易執行

---
*Created: 2025-08-22*
*Target: 3-hour MVP implementation*