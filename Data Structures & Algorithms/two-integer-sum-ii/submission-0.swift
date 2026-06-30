class Solution {
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        guard numbers.count > 1 else { return [] }
        var start = 0
        var end = numbers.count - 1
        while start < end {
            if numbers[start] + numbers[end] < target {
                start += 1
            } else if numbers[start] + numbers[end] > target {
                end -= 1
            } else {
                return [start + 1, end + 1]
            }
        }
        return [start + 1, end + 1]
    }
}
