class Solution {
    func characterReplacement(_ s: String, _ k: Int) -> Int {
        let s = Array(s)
        var dict: [Character: Int] = [:]
        var left = 0
        var res = 0
        for right in 0..<s.count {
            dict[s[right], default: 0] += 1
            while right - left + 1 - (dict.values.max() ?? .zero) > k {
                if let dl = dict[s[left]], dl > 0 {
                    dict[s[left], default: 0] -= 1
                } else {
                    dict[s[left]] = nil
                }
                left += 1
            }
            res = max(res, right - left + 1)
        }
        return res
    }
}
