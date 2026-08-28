/**
 * Definition for a binary tree node.
 * class TreeNode {
 *     var val: Int
 *     var left: TreeNode?
 *     var right: TreeNode?
 *     init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */

class Solution {
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        var result: [[Int]] = []
        var queue = [root]
        var headIndex = 0

        while queue.count > headIndex {
            let levelSize = queue.count - headIndex
            var rowList: [Int] = []
            for _ in 0..<levelSize {
                if let node = queue[headIndex] {
                    rowList.append(node.val)
                    if let left = node.left {
                        queue.append(left)
                    }

                    if let right = node.right {
                        queue.append(right)
                    }
                }
                headIndex += 1
            }
            if !rowList.isEmpty {
                result.append(rowList)
            }
        }
        return result
    }
}
