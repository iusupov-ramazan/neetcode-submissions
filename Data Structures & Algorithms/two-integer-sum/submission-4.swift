class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var dict: [Int: Int] = [:]
        for (i, v) in nums.enumerated() { 
            if let index = dict[v] {
                return [index, i]
            }
            dict[target - v, default: 0] = i 
        }
        return []
    }
}
