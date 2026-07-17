class Solution {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        guard s.count == t.count else { return false }
        var sBucket = Array(repeating: 0, count: 26)
        var tBucket = Array(repeating: 0, count: 26)
        for (charS, charT) in zip(s.utf8, t.utf8) {
            sBucket[Int(charS) - 97] += 1
            tBucket[Int(charT) - 97] += 1
        }
        return sBucket == tBucket
    }
}
