class Solution {
    func minEatingSpeed(_ piles: [Int], _ h: Int) -> Int {
        guard !piles.isEmpty else { return -1 }
        var left = 1
        var right = piles.max() ?? 1
        var result = right
        while left <= right {
            let mid = left + (right - left) / 2 // banana per hour
            var time = 0
            for i in 0..<piles.count {
                let pile = piles[i]
                time += Int(ceil(Double(pile) / Double(mid)))
            }
            if time > h {
                left = mid + 1
            } else {
                right = mid - 1
                result = min(result, mid)
            }
        }
        return result
    }
}
