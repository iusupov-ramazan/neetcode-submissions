class Solution {
    func minWindow(_ s: String, _ t: String) -> String {
        guard !t.isEmpty else { return String() }
        let s = Array(s)
        let t = Array(t)
        var result = String()
        var resultLen = Int.max
        var dictT: [Character: Int] = [:]
        var dictS: [Character: Int] = [:]
        for c in t { dictT[c, default: 0] += 1 }
        let need = dictT.count
        var have = 0
        var left = 0

        for i in 0..<s.count {
            dictS[s[i], default: 0] += 1
            if dictT[s[i]] != nil, dictT[s[i], default: 0] == dictS[s[i], default: 0] {
                have += 1
            }
            print(have)
            while need == have {
                if resultLen > i - left + 1 {
                    result = String(s[left...i])
                    resultLen = i - left + 1
                }

                dictS[s[left], default: 0] -= 1
                if dictS[s[left], default: 0] == 0 {
                    dictS.removeValue(forKey: s[left])
                }
                if dictT[s[left]] != nil, dictT[s[left], default: 0] > dictS[s[left], default: 0] {
                    have -= 1
                }
                left += 1
            }
        }

        return resultLen == Int.max ? String() : result
    }
}
