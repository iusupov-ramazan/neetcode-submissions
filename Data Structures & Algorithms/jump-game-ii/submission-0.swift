class Solution {
    func jump(_ nums: [Int]) -> Int {
        var steps = 0
        var left = 0
        var right = 0
        while right < nums.count - 1 {
            var farthest = 0
            for i in left...right {
                farthest = max(farthest, i + nums[i])
            }
            left = right + 1
            right = farthest
            steps += 1
        }
        return steps
    }
}
