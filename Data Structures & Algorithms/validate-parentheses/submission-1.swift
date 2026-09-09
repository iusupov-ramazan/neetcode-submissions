class Solution {
    func isValid(_ s: String) -> Bool {
        var stack: [Character] = []
        for i in s {
            if i == ")" && stack.last == "(" {
                stack.popLast()
            } else if i == "}" && stack.last == "{" {
                stack.popLast()
            } else if i == "]" && stack.last == "[" {
                stack.popLast()
            } else {
                stack.append(i)
            }
        }

        return stack.isEmpty
    }
}
