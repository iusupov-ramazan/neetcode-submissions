class Solution {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        let nums = (nums1 + nums2).sorted()
        var left = 0
        var right = nums.count - 1
        var result = Double.zero
        if nums.count % 2 != 0 {
            return Double(nums[left + (right - left) / 2])
        } else {
            var leftMid = nums[left + (right - left) / 2]
            var rightMid = nums[left + (right - left) / 2 + 1]
            return (Double(leftMid) + Double(rightMid)) / 2
        }
    }
}