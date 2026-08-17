class Solution {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        guard !matrix.isEmpty, !matrix[0].isEmpty else { return false }
        let rows = matrix.count
        let cols = matrix[0].count
        var left = 0
        var right = cols * rows - 1
        while left <= right {
            let mid = left + (right - left) / 2
            let row = mid / cols
            let col = mid % cols
            let value = matrix[row][col]
            if value == target { 
                return true
            } else if value < target {
                left += 1
            } else {
                right -= 1
            }
        } 

        return false
    }
}
