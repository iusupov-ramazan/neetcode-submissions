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
        guard let root else { return [] }
        var queue = [root]
        var result: [[Int]] = []
        var headDepth = 0

        while headDepth < queue.count {
            let levelSize = queue.count - headDepth
            var list: [Int] = []
            for _ in 0..<levelSize {
                let node = queue[headDepth]
                list.append(node.val)
                if let left = node.left { queue.append(left) }
                if let right = node.right { queue.append(right) }
                headDepth += 1
            }
            result.append(list)
        }
        return result
    }
}
