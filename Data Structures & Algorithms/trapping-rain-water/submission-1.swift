class Solution {
    func trap(_ height: [Int]) -> Int {
        var maxLeft = height[0]
        var maxRight = height[height.count - 1]
        var left = 0
        var right = height.count - 1
        var result = 0

        while left < right {
            if maxRight >= maxLeft {
                left += 1
                maxLeft = max(maxLeft, height[left])
                result += max(0, maxLeft - height[left])
            } else {
                right -= 1
                maxRight = max(maxRight, height[right])
                result += max(0, maxRight - height[right])
            }
        }
        return result
    }
}
