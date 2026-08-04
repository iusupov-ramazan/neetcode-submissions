class Solution {
    func findMin(_ nums: [Int]) -> Int {
        var nums = nums
        var start = 0
        var end = nums.count - 1
        var minN = Int.max
        while start <= end {
            while nums[end] < nums[start] {
                let lastNum = nums.popLast()!
                nums.insert(lastNum, at: 0)
                minN = min(lastNum, minN)
            }
            print(nums)
            let mid = start + (end - start) / 2
            print(minN)
            print(nums[mid])
            if nums[mid] < minN {
                end = mid - 1
            } else {
                start = mid + 1
            }
            minN = min(nums[mid], minN)
        }
        return minN
    }
}
