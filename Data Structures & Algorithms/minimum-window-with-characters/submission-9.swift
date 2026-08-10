class Solution {
    func minWindow(_ s: String, _ t: String) -> String {
        guard t.count <= s.count, !t.isEmpty else { return "" }
        
        let s = Array(s)
        let t = Array(t)
        
        var dict1: [Character: Int] = [:]
        var dict2: [Character: Int] = [:]
        
        for c in t { dict1[c, default: 0] += 1 }
        
        let need = dict1.count
        var have = 0
        
        var minLength = Int.max
        var startIdx = 0
        
        var left = 0
        
        for right in 0..<s.count {
            let rightChar = s[right]
            dict2[rightChar, default: 0] += 1
            
            if let targetCount = dict1[rightChar], dict2[rightChar] == targetCount {
                have += 1
            }
            
            while have == need {
                let currentLength = right - left + 1
                
                if currentLength < minLength {
                    minLength = currentLength
                    startIdx = left
                }
                
                let leftChar = s[left]
                dict2[leftChar, default: 0] -= 1
                
                if let targetCount = dict1[leftChar],
                dict2[leftChar]! < targetCount {
                    have -= 1
                }
                
                left += 1
            }
        }
        
        return minLength == Int.max 
        ? "" 
        : String(s[startIdx..<(startIdx + minLength)])
    }
}
