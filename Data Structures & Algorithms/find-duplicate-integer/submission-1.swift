class Solution {
    func findDuplicate(_ nums: [Int]) -> Int {
        let nums = nums.sorted()
        var left = 0
        var right = 1
        while right <= nums.count - 1 {
            if nums[left] == nums[right] {
                return nums[left]
            }
            left += 1
            right += 1
        }
        return -1
    }
}
