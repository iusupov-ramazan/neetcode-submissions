class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        let s = Array(s)
        var set = Set<Character>()
        var left = 0
        var longestSubs = 0
        for right in 0..<s.count {
            while set.contains(s[right]) {
                set.remove(s[left])
                left += 1
            }
            set.insert(s[right])
            longestSubs = max(longestSubs, right - left + 1)
        }
        return longestSubs
    }
}
