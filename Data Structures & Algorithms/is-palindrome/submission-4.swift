class Solution {
    func isPalindrome(_ s: String) -> Bool {
        let s = Array(
            s.filter { $0.isNumber || $0.isLetter }
            .lowercased()
            .replacingOccurrences(of: " ", with: "")
        )
        var (l, r) = (0, s.count - 1)
        while l < r {
            if s[l] != s[r] { return false }
            l += 1 
            r -= 1
        }
        return true
    }
}
