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

    private var left: Node?
    private var right: Node?
    
    
    init(_ capacity: Int) {
        self.cache = [:]
        self.capacity = capacity
        
        (self.right, self.left) = (Node(0, 0), Node(0, 0))
        self.right?.prev = self.left
        self.left?.next = self.right
    }

    func get(_ key: Int) -> Int {
        if let node = cache[key] {
            remove(node)
            insert(node)
            return node.val
        }
        return -1
    }

    func put(_ key: Int, _ value: Int) {
        if let node = cache[key] {
            remove(node)
        }
        let node = Node(key, value)
        cache[key] = node
        insert(node)
        if cache.count > capacity {
            if let lru = left?.next {
                remove(lru)
                cache[lru.key] = nil
            }
        }
    }
    
    private func remove(_ node: Node?) {
        let prev = node?.prev
        let next = node?.next
        prev?.next = next
        next?.prev = prev
    }
    
    private func insert(_ node: Node?) {
        let prev = right?.prev
        let next = right
        prev?.next = node
        next?.prev = node
        node?.next = next
        node?.prev = prev
    }
}