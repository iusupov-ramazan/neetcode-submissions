class Solution {
    func dailyTemperatures(_ temperatures: [Int]) -> [Int] {
        var stack: [Int] = []
        var result: [Int] = Array(repeating: 0, count: temperatures.count)

        for i in 0..<temperatures.count {
            while let lastI = stack.last, case let item = temperatures[lastI], item < temperatures[i] {
                let lastIndex = (stack.popLast() ?? .zero)
                result[lastIndex] = i - lastIndex
            }
            stack.append(i)
        }

        return result
    }
}
