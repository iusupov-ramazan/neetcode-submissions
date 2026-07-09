class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        var maxProfit = 0
        var buyPrice = prices[0]
        for i in 1..<prices.count {
            let currentPrice = prices[i]
            buyPrice = min(buyPrice, currentPrice)
            maxProfit = max(currentPrice - buyPrice, maxProfit)
        }
        return maxProfit
    }
}
