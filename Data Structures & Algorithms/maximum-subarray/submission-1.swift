class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        var result = Int.min
        var sum = 0
        for i in nums {
            sum += i
            result = max(sum, result)
            sum = max(sum, 0)
        }
        return result
    }
}
