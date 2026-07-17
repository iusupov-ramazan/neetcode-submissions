class Solution {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        var dictS: [Character: Int] = [:]
        var dictT: [Character: Int] = [:]

        for i in s {
            dictS[i, default: 0] += 1
        }

        for i in t {
            dictT[i, default: 0] += 1
        }

        return dictS == dictT
    }
}
