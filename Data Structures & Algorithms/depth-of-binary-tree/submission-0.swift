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
    func maxDepth(_ root: TreeNode?) -> Int {
        guard root != nil else { return 0 }
        let leftTreeSum = maxDepth(root?.left) + 1
        let rightTreeSum = maxDepth(root?.right) + 1

        return max(leftTreeSum, rightTreeSum)
    }
}
