class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var dict: [Int: Int] = [:]
        for i in 0..<nums.count {
            let num = nums[i]
            if let t = dict[num] {
                return [t, i]
            }
            let diff = target - num
            dict[diff, default: 0] = i
        }

        print(dict)
        return []
    }
}
