class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        let s = Array(s)
        var left = 0
        var set = Set<Character>()
        var maxCount = 0
        for right in 0..<s.count {
            while set.contains(s[right]) {
                set.remove(s[left])
                left += 1
            }
            set.insert(s[right])
            maxCount = max(maxCount, right - left + 1)
        }
        return maxCount
    }
}
