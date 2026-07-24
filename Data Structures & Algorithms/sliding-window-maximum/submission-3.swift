class Solution {
    func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
        var deque: [Int] = []
        var right = 0
        var result: [Int] = []
        while right < nums.count {
            while !deque.isEmpty && deque.first! == right - k {
                deque.removeFirst()
            }

            while !deque.isEmpty && nums[deque.last!] < nums[right] {
                deque.removeLast()
            }

            deque.append(right)
            if right >= k - 1 {
                result.append(nums[deque.first!])
            }

            right += 1
        }
        return result
    }
}
