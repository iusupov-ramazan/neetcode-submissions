class MinStack {
    
    private var stack: [Int] 
    private var minValue: Int = Int.max

    init() {
        stack = []
    }

    func push(_ val: Int) {
        if stack.isEmpty {
            stack.append(0)
            minValue = val    
        } else {
            stack.append(val - minValue)
            minValue = min(val, minValue)
        }
    }

    func pop() {
        guard let pop = stack.popLast() else { return }
        if pop < 0 {
            minValue -= pop
        }
    }

    func top() -> Int {
        guard let top = stack.last else { return 0 }
        return top > 0 ? top + minValue : minValue
    }

    func getMin() -> Int {
        return minValue
    }
}
