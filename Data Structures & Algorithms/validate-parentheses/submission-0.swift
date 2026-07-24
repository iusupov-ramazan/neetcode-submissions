class Solution {
    func isValid(_ s: String) -> Bool {
        guard !s.isEmpty else { return false }
        let s = Array(s)
        var stack: [Character] = []
        for i in 0..<s.count {
            if !stack.isEmpty {
                switch stack.last! {
                case "(" where s[i] == ")":
                    stack.removeLast()
                case "[" where s[i] == "]":
                    stack.removeLast()
                case "{" where s[i] == "}":
                    stack.removeLast()
                default:
                    stack.append(s[i])
                }
            } else {
                stack.append(s[i])
            }
        }
        return stack.isEmpty
    }
}
