class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var dict: [String: [String]] = [:]
        for i in strs {
            let sorted = String(i.sorted())
            dict[sorted, default: []].append(i)
        }
        return dict.map { $0.value }
    }
}
