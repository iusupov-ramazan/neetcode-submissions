class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var dict: [String: [String]] = [:]
        for str in strs {
            let str = String(str)
            dict[String(str.sorted()), default: []].append(str)
        }
        return Array(dict.values)
    }
}
