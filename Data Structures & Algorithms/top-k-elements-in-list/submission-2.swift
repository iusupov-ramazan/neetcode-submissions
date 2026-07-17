class Solution {
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        var dict: [Int: Int] = [:]
        for n in nums {
            dict[n, default: 0] += 1
        }
        return Array(dict.sorted(by: { $0.value > $1.value }).prefix(k).map(\.key))
    }
}
