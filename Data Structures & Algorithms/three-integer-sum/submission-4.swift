class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        var nums = nums.sorted()
        var result = [[Int]]()

        for i in 0..<nums.count - 2 {
            var left = i + 1
            var right = nums.count - 1
            if i > 0, nums[i] == nums[i - 1] { continue }
            while left < right {
                if nums[left] + nums[right] + nums[i] == 0 {
                    result.append([nums[left], nums[right], nums[i]])
                    left += 1
                    right -= 1
                    while left < right, nums[left] == nums[left - 1] { left += 1}
                    while left < right, nums[right] == nums[right + 1] { right -= 1}
                } else if nums[left] + nums[right] + nums[i] > 0 {
                    right -= 1
                } else {
                    left += 1
                }
            }
        }
        return result
    }
}
