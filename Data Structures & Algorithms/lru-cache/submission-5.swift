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
    private var cache: [Int: ListNode]
    private let capacity: Int
    private var left: ListNode?
    private var right: ListNode?
    
    init(_ capacity: Int) {
        self.capacity = capacity
        self.cache = [:]
        self.left = ListNode(0, 0)
        self.right = ListNode(0, 0)
        left?.next = right
        right?.prev = left
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
            node.val = value
            remove(node)
            insert(node)
            return
        }
        
        if cache.count >= capacity {
            if let lru = left?.next {
                remove(lru)
                cache.removeValue(forKey: lru.key)
            }
        }
        
        let newNode = ListNode(key, value)
        insert(newNode)
        cache[key] = newNode
    }
    
    private func remove(_ node: ListNode?) {
        guard let node = node else { return }
        let prevNode = node.prev
        let nextNode = node.next
        prevNode?.next = nextNode
        nextNode?.prev = prevNode
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
