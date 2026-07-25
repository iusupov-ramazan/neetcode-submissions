class Solution {
    func evalRPN(_ tokens: [String]) -> Int {
        var stack: [Int] = []
        for i in 0..<tokens.count {
            let symb = tokens[i]
            switch symb {
            case "+":
                let (num2, num1) = (getNum(), getNum())
                let num = num1 + num2
                stack.append(num)
            case "-":
                let (num2, num1) = (getNum(), getNum())
                let num = num1 - num2
                stack.append(num)
            case "*":
                let (num2, num1) = (getNum(), getNum())
                let num = num1 * num2
                stack.append(num)
            case "/":
                let (num2, num1) = (getNum(), getNum())
                let num = num1 / num2
                stack.append(num)
            default:
                let num = Int(symb) ?? .zero
                stack.append(num)
            }
        }
        return stack.last ?? .zero

        func getNum() -> Int {
            return stack.popLast() ?? .zero
        }
    }
}