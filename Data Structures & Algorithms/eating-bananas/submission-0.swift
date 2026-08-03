class Solution {
    func minEatingSpeed(_ piles: [Int], _ h: Int) -> Int {
        var start = 1
        var end = piles.max() ?? 1
        var result = end

        while start <= end {
            let mid = start + (end - start) / 2
            var sum = 0
            for i in 0..<piles.count {
                sum += Int(ceil(Double(piles[i]) / Double(mid)))
            }
            if sum > h {
                start = mid + 1
            } else {
                result = mid
                end = mid - 1
            }
        }
        return result
    }
}
