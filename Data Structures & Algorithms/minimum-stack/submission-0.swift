class MinStack {

    var stack: [Int]

    init() {
        stack = [Int]()
    }

    func push(_ val: Int) {
        stack.append(val)
    }

    func pop() {
        stack.removeLast()
    }

    func top() -> Int {
        guard let last = stack.last else { return .zero }
        return last
    }

    func getMin() -> Int {
        return stack.min() ?? .zero
    }
}
