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
    var result = Int.min

    func maxPathSum(_ root: TreeNode?) -> Int {
        _ = calculateNode(root)
        return result
    }

    func calculateNode(_ root: TreeNode?) -> Int {
        guard let root else { return 0 } 
        let left = max(0, calculateNode(root.left))
        let current = root.val
        let right = max(0, calculateNode(root.right))
        let sum = left + right + current
        result = max(sum, result)
        return current + max(left, right)
    }
}
