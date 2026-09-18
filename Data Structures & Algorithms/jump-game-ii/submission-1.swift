class Solution {
    func jump(_ nums: [Int]) -> Int {
        var left = 0
        var right = 0
        var steps = 0 

        while right < nums.count - 1 {
            var freq = 0
            for i in left...right {
                freq = max(freq, nums[i] + i)
            }    
            left = right + 1
            right = freq
            steps += 1
        }
        return steps
    }
}
