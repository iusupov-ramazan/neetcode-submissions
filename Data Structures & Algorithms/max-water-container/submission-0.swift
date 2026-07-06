class Solution {
    func maxArea(_ heights: [Int]) -> Int {
        var left = 0
        var right = heights.count - 1 
        var result = 0

        while left < right {
            let l = heights[left]
            let r = heights[right]
            let t = min(heights[left], heights[right]) * (right - left)
            result = max(result, t)

            if l < r {
                left += 1
            } else {
                right -= 1
            }
        }

        return result
    }
}
