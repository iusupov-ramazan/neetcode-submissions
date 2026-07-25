class Solution {
    func minWindow(_ s: String, _ t: String) -> String {
        guard !t.isEmpty else { return String() }
        let s = Array(s)
        let t = Array(t)
        var dictS: [Character: Int] = [:]
        var dictT: [Character: Int] = [:]
        for c in t { dictT[c, default: 0] += 1 }
        var need = dictT.count
        var have = 0
        var result = String()
        var resultLength = Int.max
        var left = 0

        for right in 0..<s.count {
            dictS[s[right], default: 0] += 1
            if dictT[s[right], default: 0] == dictS[s[right], default: 0] { have += 1 }
            while need == have {
                if resultLength > right - left + 1 {
                    result = String(s[left...right])
                    resultLength = right - left + 1
                }
                dictS[s[left], default: 0] -= 1
                if dictT[s[left], default: 0] > dictS[s[left], default: 0] { have -= 1 }
                left += 1 
            }

        }

        return result
    }
}
