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
    func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
        guard let root else { return 0 }
        let diameter = maxHeight(root.left) + maxHeight(root.right)
        let s = max(diameterOfBinaryTree(root.left), diameterOfBinaryTree(root.right))
        return max(diameter, s)
    }

    private func maxHeight(_ root: TreeNode?) -> Int {
        guard let root else { return 0 }
        let left = maxHeight(root.left)
        let right = maxHeight(root.right)
        return 1 + max(left, right)
    }
}
