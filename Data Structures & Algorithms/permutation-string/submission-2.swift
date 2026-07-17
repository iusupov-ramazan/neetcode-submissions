class Solution {
    func checkInclusion(_ s1: String, _ s2: String) -> Bool {
        let (s1, s2) = (Array(s1), Array(s2))
        var dict1: [Character: Int] = [:]
        var dict2: [Character: Int] = [:]
        var left = 0
        for i in s1 { dict1[i, default: 0] += 1 }
        for right in 0..<s2.count {
            dict2[s2[right], default: 0] += 1
            if right >= s1.count {
                dict2[s2[left], default: 0] -= 1
                if dict2[s2[left]] ?? 0 == .zero {
                    dict2[s2[left]] = nil
                }
                left += 1
            }
            if dict1 == dict2 { return true }
        }
        return false
    }
}
