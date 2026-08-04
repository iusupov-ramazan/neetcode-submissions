class Solution {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        guard !matrix.isEmpty && !matrix[0].isEmpty else { return false }
        var rows = matrix.count
        var cols = matrix[0].count
        var left = 0
        var right = rows * cols - 1
        while left <= right {
            let mid = left + (right - left) / 2
            let row = mid / cols
            let col = mid % cols
            if matrix[row][col] == target {
                return true
            } else if matrix[row][col] < target {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
        return false
    }
}