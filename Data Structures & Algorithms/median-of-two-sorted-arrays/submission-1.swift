class Solution {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        if nums1.count > nums2.count {
            return findMedianSortedArrays(nums2, nums1)
        }
        let n = nums1.count
        let m = nums2.count
        var total = nums1.count + nums2.count
        var half = (total + 1) / 2
        var left = 0
        var right = n
        
        while left <= right {
            let cut1 = (left + right) / 2
            let cut2 = half - cut1
            
            let left1Max = (cut1 == 0) ? Int.min : nums1[cut1 - 1]
            let right1Min = (cut1 == n) ? Int.max : nums1[cut1]
            
            let left2Max = (cut2 == 0) ? Int.min : nums2[cut2 - 1]
            let right2Min = (cut2 == m) ? Int.max : nums2[cut2]
            
            if left1Max <= right2Min && left2Max <= right1Min {
                if total.isMultiple(of: 2) {
                    return Double(max(left1Max, left2Max) + min(right1Min, right2Min)) / 2.0
                } else {
                    return Double(max(left1Max, left2Max))
                }
            } else if left1Max > right2Min {
                right = cut1 - 1
            } else {
                left = cut1 + 1
            }
        }
        return 0
    }
}