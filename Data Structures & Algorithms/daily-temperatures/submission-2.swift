class Solution {
    func dailyTemperatures(_ temperatures: [Int]) -> [Int] {
        var stack: [Int] = []
        var result: [Int] = Array(repeating: 0, count: temperatures.count)
        
        for i in 0..<temperatures.count {
            while let last = stack.last, temperatures[last] < temperatures[i] {
                result[last] = i - last
                print("Appended: \(i - last)")
                print("Removed: \(temperatures[last])")
                stack.removeLast()
                print("Stack is: \(stack)")
                print()
            }
            stack.append(i)
        }

        return result
    }
}
