class Solution {
    func hasDuplicate(_ nums: [Int]) -> Bool {
        return Array(Set(nums)).count != nums.count
    }
}
