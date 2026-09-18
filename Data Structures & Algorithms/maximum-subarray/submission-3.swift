class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        var res = Int.min
        var current = 0
        for n in nums {
            current += n
            res = max(res, current)
            current = max(current, 0)
        }
        return res
    }
}
