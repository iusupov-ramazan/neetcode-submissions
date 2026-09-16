class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        var result = Int.min
        var current = 0
        for i in nums {
            current += i
            result = max(result, current)
            current = max(current, 0)
        }
        return result
    }
}
