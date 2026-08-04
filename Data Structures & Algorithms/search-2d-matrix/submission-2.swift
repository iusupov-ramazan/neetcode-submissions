class Solution {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        var left = 0
        var right = matrix.count - 1

        while left <= right {
            let mid = left + (right - left) / 2
            var start = 0
            var end = matrix[mid].count - 1
            while start <= end {
                if matrix[mid][end] < target {
                    print("Moved left from: \(left) to: \(mid + 1)")
                    left = mid + 1
                    break
                } else if matrix[mid][start] > target {
                    print("Moved right from: \(right) to: \(mid - 1)")
                    right = mid - 1
                    break
                } else {
                    let innerMid = start + (end - start) / 2
                    print("Started inner loop: with number \(matrix[mid][innerMid]) at inner mid inder: \(innerMid)")
                    if matrix[mid][innerMid] == target {
                        return true
                    } else if matrix[mid][innerMid] > target {
                        end = innerMid - 1
                        print("Inner end changed")
                    } else {
                        start = innerMid + 1
                        print("Inner start changed")
                    }
                }
                print()
            }
        }
        return false
    }
}