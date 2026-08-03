class Solution {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        var start = 0
        var end = matrix.count - 1
        
        while start <= end {
            let mid = start + (end - start) / 2
            var innerStart = 0
            var innerEnd = matrix[mid].count - 1
            print(matrix[mid][innerEnd])
            print(matrix[mid][innerStart])
            if matrix[mid][innerEnd] < target {
                start = mid + 1
                print("Updated start: \(start)")
            } else if matrix[mid][innerStart] > target {
                end = mid - 1
                print("Updated end: \(end)")
            } else {
                while innerStart <= innerEnd {
                    let innerMid = innerStart + (innerEnd - innerStart) / 2
                    print("Num here is: \(matrix[mid][innerMid])")
                    print()
                    if matrix[mid][innerMid] == target {
                        return true
                    } else if matrix[mid][innerMid] < target {
                        innerStart = innerMid + 1
                    } else {
                        innerEnd = innerMid - 1
                    }
                }
                end = mid - 1
            }
        }
        return false
    }
}
