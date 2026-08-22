class Solution {
    func findDuplicate(_ nums: [Int]) -> Int {
        var slow = 0
        var fast = 0
        repeat {
            slow = nums[slow]
            fast = nums[nums[fast]]
        } while slow != fast

        fast = 0
        repeat {
            slow = nums[slow]
            fast = nums[fast]
        } while slow != fast
        return slow
    }
}
