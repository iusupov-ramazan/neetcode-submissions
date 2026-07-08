class Solution {
    func trap(_ height: [Int]) -> Int {
        var left = 0
        var right = height.count - 1
        var maxLeft = height[left]
        var maxRight = height[right]
        var result = 0
        while left < right {
            if maxLeft > maxRight {
                right -= 1
                maxRight = max(maxRight, height[right])
                result += maxRight - height[right]
            } else {
                left += 1
                maxLeft = max(maxLeft, height[left])
                result += maxLeft - height[left]
            }
        }
        return result
    }
}
