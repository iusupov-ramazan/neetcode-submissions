class Solution {
    func characterReplacement(_ s: String, _ k: Int) -> Int {
       let s = Array(s)
       var left = 0
       var dict: [Character: Int] = [:]
       var maxF = 0
       var res = 0
       for right in 0..<s.count {
            dict[s[right], default: 0] += 1
            maxF = max(maxF, (dict[s[right]] ?? .zero))
            while right - left + 1 - maxF > k {
                dict[s[left], default: 0] -= 1
                if dict[s[left], default: 0] <= 0 {
                    dict[s[left]] = nil
                }
                left += 1
            }
            res = max(res, right - left + 1)
       }
       return res
    }
}
