class TimeMap {

    private var dict: [String: [Int: String]]

    init() {
        dict = [:]
    }

    func set(_ key: String, _ value: String, _ timestamp: Int) {
        dict[key, default: [:]][timestamp] = value
    }

    func get(_ key: String, _ timestamp: Int) -> String {
        let closestKey = binarySearch(dict[key, default: [:]], target: timestamp) ?? Int.min
        return dict[key]?[closestKey] ?? String()
    }
    
    func getDict() -> [String: [Int: String]] {
        return dict
    }
    
    func binarySearch(_ keys: [Int: String]?, target: Int) -> Int? {
        guard let k = keys?.keys, case let keys = Array(k).sorted() else { return -1 }
        var left = 0
        var right = keys.count - 1
        var closestStamp = Int.min
        while left <= right {
            let mid = left + (right - left) / 2
            if keys[mid] == target {
                return keys[mid]
            } else if keys[mid] > target {
                right = mid - 1
            } else {
                left = mid + 1
                closestStamp = max(closestStamp, mid)
            }
        }
        print("Keys are: \(keys), Closest: \(closestStamp)")
        return closestStamp == Int.min ? nil : keys[closestStamp]
    }
}
