class Solution {
    func hasDuplicate(_ nums: [Int]) -> Bool {
        var set = Set<Int>()
        for i in nums {
            if set.contains(i) {
                return true
            }
            set.insert(i)
        }
        return false
    }
}
