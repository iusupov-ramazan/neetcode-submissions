class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        let nums = nums.sorted()
        var answers: [[Int]] = []

        for i in 0..<nums.count - 2 {
            var left = i + 1
            var right = nums.count - 1 
            if i > 0, nums[i] == nums[i - 1] { continue }
            while left < right {
                let sum = nums[left] + nums[i] + nums[right]
                if sum == 0 {
                    answers.append([nums[left], nums[right], nums[i]])
                    left += 1
                    right -= 1
                    while nums[left] == nums[left - 1], left < right { left += 1 }
                    while nums[right] == nums[right + 1], left < right { right -= 1 }
                } else if sum > 0 {
                    right -= 1
                } else {
                    left += 1
                }
            }
        }
        return answers
    }
}
