class Solution {
    func isValidSudoku(_ board: [[Character]]) -> Bool {
        var rows = Array(repeating: Set<Character>(), count: 9)
        var cols = Array(repeating: Set<Character>(), count: 9)
        var boxes = Array(repeating: Set<Character>(), count: 9)
        
        for row in 0..<board.count {
            print()
            for column in 0..<board[row].count {
                let char = board[row][column]
                guard char != "." else { continue }
                let boxIndex = (row/3) * 3 + (column/3)

                if rows[row].contains(char) || cols[column].contains(char) || boxes[boxIndex].contains(char) {
                    return false
                } else {
                    rows[row].insert(char)
                    cols[column].insert(char)
                    boxes[boxIndex].insert(char)
                }
            }
        }
        return true
    }
}
