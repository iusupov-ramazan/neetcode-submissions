class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        let s = Array(s)
        var set = Set<Character>()
        var left = 0
        var result = 0
        for right in 0..<s.count {
            let c = s[right]
            while set.contains(c) {
                set.remove(s[left])
                left += 1
            }
            set.insert(c)
            result = max(result, right - left + 1)
        }
        return result
    }
}
