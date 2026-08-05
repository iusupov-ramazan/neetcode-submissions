class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        var left = 0
        var right = nums.count - 1
        while left <= right {
            let mid = left + (right - left) / 2
            print()
            print("Mid: \(mid)")
            if nums[mid] == target {
                return mid
            } else if nums[mid] > nums[right] {
                if nums[mid] > target && nums[right] < target {
                    print("Moved right from: \(right), to: \(mid)")
                    right = mid
                } else {
                    left = mid + 1
                }
            } else if nums[mid] < nums[left] {
                if nums[mid] < target && nums[left] > target {
                    print("Moved right from: \(right), to: \(mid)")
                    left = mid + 1
                } else {
                    right = mid - 1
                }
            } else {
                if nums[mid] > target {
                    right = mid - 1
                    print("Moved right from: \(right), to: \(mid - 1)")
                } else {
                    left = mid + 1
                    print("Moved left from: \(left), to: \(mid + 1)")
                }
            }
        }
        return -1
    }
}