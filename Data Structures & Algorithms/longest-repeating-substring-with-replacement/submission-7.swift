class Solution {
    func characterReplacement(_ s: String, _ k: Int) -> Int {
        let s = Array(s)
        var dict: [Character: Int] = [:]
        var left = 0
        var sequence = 0 
        var result = 0

        for right in 0..<s.count {
            dict[s[right], default: 0] += 1
            sequence = max(sequence, dict[s[right], default: 0])
            if right - left + 1 - sequence <= k {
                result = max(result, right - left + 1)
            } else {
                dict[s[left], default: 0] -= 1
                if dict[s[left], default: 0] == 0 {
                    dict.removeValue(forKey: s[left])
                }
                left += 1
            }
        }
        print(dict)
        return result
    }
}
