class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        var maxSum = nums[0]
        var currSum = 0
        
        for i in nums {
            currSum = max(0, currSum)
            currSum += i
            maxSum = max(currSum, maxSum)
        }

        return maxSum
    }
}
