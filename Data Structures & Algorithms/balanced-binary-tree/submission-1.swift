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
    func isBalanced(_ root: TreeNode?) -> Bool {
        guard let root else { return true }
        let left = maxHeight(root.left)
        let right = maxHeight(root.right)
        let balanced = abs(left - right) < 2
        let isLeftBalanced = isBalanced(root.left)
        let isRightBalanced = isBalanced(root.right)
        return balanced && isRightBalanced && isLeftBalanced
    }

    private func maxHeight(_ root: TreeNode?) -> Int {
        guard let root else { return 0 }
        let left = maxHeight(root.left)
        let right = maxHeight(root.right)
        return 1 + max(left, right)
    }
}
