class Node {
    
    var key: Int
    var val: Int
    var next: Node?
    var prev: Node?
    
    init(_ key: Int, _ val: Int) {
        self.val = val
        self.key = key
        self.next = nil
        self.prev = nil
    }
}

extension Node: CustomDebugStringConvertible, Hashable {
    static func == (lhs: Node, rhs: Node) -> Bool {
        return lhs === rhs
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(hashValue)
    }
    
    var debugDescription: String {
        return "\(val) -> \(next?.debugDescription ?? "nil")"
    }
}

class LRUCache {

    private var cache: [Int: Node]
    private let capacity: Int
    private var (left, right): (Node?, Node?)
    
    init(_ capacity: Int) {
        self.capacity = capacity
        self.cache = [:]
        (self.left, self.right) = (Node(0, 0), Node(0, 0))
        self.right?.prev = self.left
        self.left?.next = self.right
    }

    func get(_ key: Int) -> Int {
        if let value = cache[key] {
            remove(value)
            insert(value)
            return value.val
        }
        return -1
    }

    func put(_ key: Int, _ value: Int) {
        if let value = cache[key] {
            remove(value)
        }
        let node = Node(key, value)
        insert(node)
        cache[key] = node
        if cache.count > capacity {
            if let lru = left?.next {
                remove(lru)
                cache[lru.key] = nil
            }
        }
    }
    
    private func insert(_ node: Node?) {
        let prev = right?.prev
        prev?.next = node
        node?.prev = prev
        node?.next = right
        right?.prev = node
    }
    
    private func remove(_ node: Node?) {
        let prev = node?.prev
        let next = node?.next
        prev?.next = next
        next?.prev = prev
    }
}