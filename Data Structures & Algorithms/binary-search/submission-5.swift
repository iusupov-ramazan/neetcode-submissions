class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        var start = 0 
        var end = nums.count - 1

        while start <= end {
            let mid = end - ((end - start) / 2)
            if nums[mid] > target { 
                end = mid - 1
            } else if nums[mid] < target { 
                start = mid + 1
            } else {
                return mid
            }
        }
        return -1
    }
}
