class Solution {
    func minWindow(_ s: String, _ t: String) -> String {
        guard !t.isEmpty else { return String() }
        let s = Array(s)
        let t = Array(t)
        var left = 0
        var dictT: [Character: Int] = [:]
        var dictS: [Character: Int] = [:]

        for c in t { dictT[c, default: 0] += 1 }
        var have = 0
        let need = dictT.count
        var result = String()
        var resultLen = Int.max

        for right in 0..<s.count {
            dictS[s[right], default: 0] += 1
            if let v = dictT[s[right]], v == dictS[s[right]]! { have += 1 }
            
            while have == need {
                if resultLen > right - left + 1 {
                    result = String(s[left...right])
                    resultLen = right - left + 1
                }
                dictS[s[left], default: 0] -= 1
                if dictS[s[left], default: 0] == 0 {
                    dictS.removeValue(forKey: s[left])
                }
                if dictT[s[left], default: 0] > dictS[s[left], default: 0] { 
                    have -= 1 
                }
                left += 1
            }
        }
        return resultLen == Int.max ? String() : result
    }
}

