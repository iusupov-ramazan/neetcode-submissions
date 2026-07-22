class Solution { 
    func minWindow(_ s: String, _ t: String) -> String { 
        guard !t.isEmpty else { return String() } 
        
        let s = Array(s) 
        var dict1: [Character: Int] = [:] 
        var dict2: [Character: Int] = [:] 
        
        for value in t { 
            dict1[value, default: 0] += 1 
        } 
        
        var left = 0 
        var have = 0 
        let need = dict1.count 
        
        var result = String() 
        var resLen = Int.max 
        
        for (index, value) in s.enumerated() { 
            dict2[value, default: 0] += 1 
            
            if let targetCount = dict1[value], dict2[value] == targetCount { 
                have += 1 
            } 
            
            while have == need { 
                let currentLen = index - left + 1
                if currentLen < resLen { 
                    result = String(s[left...index]) 
                    resLen = currentLen
                } 
                
                let leftChar = s[left]
                dict2[leftChar, default: 0] -= 1 
                
                if let targetCount = dict1[leftChar], dict2[leftChar, default: 0] < targetCount { 
                    have -= 1 
                } 
                
                left += 1 
            } 
        } 
        
        return resLen != Int.max ? result : String() 
    } 
}
