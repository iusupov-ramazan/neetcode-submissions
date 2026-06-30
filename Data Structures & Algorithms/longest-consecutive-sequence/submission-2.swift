class Solution {
    func longestConsecutive(_ nums: [Int]) -> Int {
        let s = Set(nums)
        var longestCons = 0
        for i in 0..<nums.count {
            let num = nums[i] - 1
            if s.contains(num) {
                continue
            } else {
                var lenght = 1
                while s.contains(lenght + num) {
                    lenght += 1
                }
                longestCons = max(lenght - 1, longestCons)
            }
        }
        return longestCons
    }
}
