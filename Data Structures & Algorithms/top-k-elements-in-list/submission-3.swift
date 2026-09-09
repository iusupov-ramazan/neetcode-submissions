class Solution {
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        var dict: [Int: Int] = [:]
        for i in nums { dict[i, default: 0] += 1 }
        return dict
                .sorted(by: { $0.value > $1.value })
                .prefix(k)
                .map { $0.key }
    }
}
