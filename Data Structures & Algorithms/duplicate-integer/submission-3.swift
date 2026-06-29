class Solution {
    func hasDuplicate(_ nums: [Int]) -> Bool {
        var dict: [Int: Int] = [:]
        for i in nums {
            if dict[i] != nil {
                return true
            } else {
                dict[i, default: 0] += 1
            }
        }
        return false
    }
}
