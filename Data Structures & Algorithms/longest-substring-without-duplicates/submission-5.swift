class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        let s = Array(s)
        var set = Set<Character>()
        var left = 0
        var length = 0
        for right in 0..<s.count {
            while set.contains(s[right]) {
                set.remove(s[left])
                left += 1
            }
            length = max(length, right - left + 1)
            set.insert(s[right])
        }
        return length
    }
}
