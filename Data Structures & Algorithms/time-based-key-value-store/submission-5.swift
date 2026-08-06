class TimeMap {
    
    private var dict: [String: [(time: Int, value: String)]]
    
    init() {
        dict = [:]
    }

    func set(_ key: String, _ value: String, _ timestamp: Int) {
        dict[key, default: []].append((time: timestamp, value: value))
    }

    func get(_ key: String, _ timestamp: Int) -> String {
        let list = dict[key] ?? []
        var left = 0
        var right = list.count - 1
        var closesTime = String()
        while left <= right {
            let mid = left + (right - left) / 2
            if list[mid].time <= timestamp {
                closesTime = list[mid].value
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
        return closesTime
    }
}
