class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        guard !prices.isEmpty else { return 0 }
        var buyPrice = prices[0] 
        var profit = 0
        for i in 1..<prices.count {
            let currentPrice = prices[i]
            profit = max(profit, currentPrice - buyPrice)
            buyPrice = min(buyPrice, currentPrice)
        }
        return profit
    }
}
