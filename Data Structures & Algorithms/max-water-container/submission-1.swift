class Solution {
    func maxArea(_ heights: [Int]) -> Int {
        var left = 0
        var right = heights.count - 1
        var res = 0
        while left < right {
            let l = heights[left]
            let r = heights[right]
            let area = min(l, r) * (right - left)
            res = max(res, area)
            if l < r {
                left += 1
            } else {
                right -= 1
            }
        }
        return res
    }
}
