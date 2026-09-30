class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        let nums = nums.sorted()
        var result: [[Int]] = []

        for i in 0..<nums.count {
            var left = i + 1
            var right = nums.count - 1
            if i > 0, nums[i - 1] == nums[i] { continue }
            
            while left < right {
                let sum = nums[i] + nums[left] + nums[right]
                if sum == 0 {
                    result.append([nums[i], nums[left], nums[right]])
                    left += 1
                    right -= 1
                    while left < right, nums[left] == nums[left - 1] { left += 1 }
                    while left < right, nums[right] == nums[right + 1] { right -= 1 }
                } else if sum > 0 {
                    right -= 1
                } else {
                    left += 1
                }
            }
        }

        return result
    }
}