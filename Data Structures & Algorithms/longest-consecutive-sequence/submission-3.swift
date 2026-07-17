class Solution {
    func longestConsecutive(_ nums: [Int]) -> Int {
        let s = Set(nums)
        var longestCons = 0
        for i in 0..<nums.count {
            let num = nums[i]
            // if s.contains(num) {
            //     continue
            // } else {
                var length = 1
                while s.contains(num + length) {
                    length += 1
                }
                longestCons = max(longestCons, length)
            // }
        }
        return longestCons
    }
}
