class Solution {
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
       guard numbers.count > 1 else { return [] }
       var left = 0
       var right = numbers.count - 1
       while left < right {
        let l = numbers[left]
        let r = numbers[right]
        if l + r > target {
            right -= 1
        } else if l + r < target {
            left += 1
        } else {
            return [left + 1, right + 1]
        }
       }
       return [left + 1, right + 1]
    }
}
