class ListNode {
    var key: Int
    var val: Int
    var next: ListNode?
    var prev: ListNode?
    init(_ key: Int, _ val: Int) {
        self.key = key
        self.val = val
        self.next = nil
        self.prev = nil
    }
}

class LRUCache {
    private var cache: [Int: ListNode?]
    private let capacity: Int
    
    private var left: ListNode?
    private var right: ListNode?
    
    init(_ capacity: Int) {
        self.capacity = capacity
        cache = [:]

        left = ListNode(0, 0)
        right = ListNode(0, 0)

        left?.next = right
        right?.prev = left
    }

    func get(_ key: Int) -> Int {
        if let v = cache[key] {
            remove(v)
            insert(v)
            return v?.val ?? .zero
        }
        return -1
    }

    func put(_ key: Int, _ value: Int) {
        if let v = cache[key] {
            remove(v)
            cache[key] = nil
        }

        if capacity <= cache.count {
            if let lru = left?.next {
                remove(lru)
                cache[lru.key] = nil
            }
        }

        let node = ListNode(key, value)
        insert(node)
        cache[key] = node
    }

    func remove(_ node: ListNode?) {
        let prev = node?.prev
        let next = node?.next
        prev?.next = next
        next?.prev = prev
    }

    private func insert(_ node: ListNode?) {
        guard let node = node else { return }
        let prevNode = right?.prev
        prevNode?.next = node
        node.prev = prevNode
        node.next = right
        right?.prev = node
    }
}
