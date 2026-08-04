import Foundation

class Solution {
    func minEatingSpeed(_ piles: [Int], _ h: Int) -> Int {
        guard !piles.isEmpty else { return -1 }
        let piles = piles.sorted(by: >)
        var left = 1
        var right = piles.max()!
        var result = right

        while left <= right {
            print("Left: \(left), right: \(right)")
            let mid = left + (right - left) / 2
            var time = 0
            for i in 0..<piles.count {
                let pile = piles[i]
                time += Int(ceil(Double(pile) / Double(mid)))
            }
            print("Current time: \(time)")
            
            if time > h {
                left = mid + 1
            } else {
                right = mid - 1
                result = min(mid, result)
                print("Mid: \(mid), result: \(result)")
            }
            print()
        }
        return result
    }
}