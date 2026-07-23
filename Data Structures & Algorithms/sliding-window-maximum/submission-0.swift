class Solution {
    func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
        var left = 0 
        var result: [Int] = []
        
        for right in 0..<nums.count {
            if right - left + 1 == k { 
                let maxNum = nums[left...right].max() ?? .zero
                result.append(maxNum)
                left += 1
            }
        }
        return result
    }
}
