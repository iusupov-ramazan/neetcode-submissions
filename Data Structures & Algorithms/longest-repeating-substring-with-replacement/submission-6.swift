class Solution {
    func characterReplacement(_ s: String, _ k: Int) -> Int {
        let s = Array(s)
        var dict: [Character: Int] = [:]
        var maxFreq = 0
        var left = 0
        var result = 0
        for right in 0..<s.count {
            dict[s[right], default: 0] += 1
            maxFreq = max(maxFreq, dict[s[right], default: 0])
            while right - left + 1 - maxFreq > k {
                dict[s[left], default: 0] -= 1
                if dict[s[left], default: 0] == 0 {
                    dict.removeValue(forKey: s[left])
                }
                left += 1
            }
            result = max(result, right - left + 1)
        }
        return result
    }
}
