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
        var queue = [root]
        var headIndex = 0
        var result: [[Int]] = []

        while headIndex < queue.count {
            let levelSize = queue.count - headIndex
            var currList: [Int] = []
            for _ in 0..<levelSize {
                if let node = queue[headIndex] {
                    if let left = node.left { queue.append(left) }
                    if let right = node.right { queue.append(right) }

                    currList.append(node.val)
                }
                headIndex += 1
            }
            if !currList.isEmpty {
                result.append(currList)
            }
        }
        
        return result
    } 
}
