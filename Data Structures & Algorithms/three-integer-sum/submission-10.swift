class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        let nums = nums.sorted()
        var result: [[Int]] = []

        for i in 0..<nums.count {
            var l = i + 1
            var r = nums.count - 1
            if i > 0, nums[i] == nums[i - 1] { continue }
            while l < r {
                if nums[i] + nums[l] + nums[r] == 0 {
                    result.append([nums[i], nums[l], nums[r]])
                    l += 1
                    r -= 1
                    while l < r, nums[l] == nums[l - 1] { l += 1 }
                    while l < r, nums[r] == nums[r + 1] { r -= 1 }
                } else if nums[i] + nums[l] + nums[r] > 0 { 
                    r -= 1
                } else {
                    l += 1
                }
            }
        }
        return result
    }
}

// [-4,-1,-1,0,1,2]
