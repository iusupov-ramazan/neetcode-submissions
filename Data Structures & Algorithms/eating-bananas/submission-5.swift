class Solution {
    func minEatingSpeed(_ piles: [Int], _ h: Int) -> Int {
        guard !piles.isEmpty else { return -1 }
        var left = 1
        var right = piles.max()!
        var result = right
        while left <= right {
            let mid = left + (right - left) / 2
            var sum = 0
            for i in 0..<piles.count {
                sum += (piles[i] + mid - 1) / mid
            }
            if sum <= h {
                right = mid - 1
                result = mid
            } else {
                left = mid + 1
            }
        } 
        return result
    }
}
