class LRUCache {
    
    private var cache: [(key: Int, value: Int)]
    private let capacity: Int 

    init(_ capacity: Int) {
        self.cache = []
        self.capacity = capacity
    }

    func get(_ key: Int) -> Int {
        for i in 0..<cache.count {
            if cache[i].key == key {
                let temp = cache.remove(at: i)
                cache.append(temp)
                return temp.value
            }
        }
        return -1
    }

    func put(_ key: Int, _ value: Int) {
        for i in 0..<cache.count {
            if cache[i].key == key {
                var temp = cache.remove(at: i)
                temp.value = value
                cache.append(temp)
                return
            }
        }
        if cache.count == capacity {
            cache.removeFirst()
        }
        cache.append((key: key, value: value))
    }
}
