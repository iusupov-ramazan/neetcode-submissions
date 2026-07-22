class Solution {
    func checkInclusion(_ s1: String, _ s2: String) -> Bool {
        var dict1: [Character: Int] = [:]
        var dict2: [Character: Int] = [:]
        let s1 = Array(s1)
        let s2 = Array(s2)
        var left = 0

        for char in s1 { dict1[char, default: 0] += 1 }

        for right in 0..<s2.count {
            dict2[s2[right], default: 0] += 1
            if right - left + 1 > s1.count {
                dict2[s2[left], default: 0] -= 1
                if dict2[s2[left], default: 0] == 0 {
                    dict2.removeValue(forKey: s2[left])
                }
                left += 1
            }

            if dict1 == dict2 { return true }
        }

        return false
    }
}
