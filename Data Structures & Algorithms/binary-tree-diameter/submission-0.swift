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
        let d = height(root.left) + height(root.right)
        let h = max(diameterOfBinaryTree(root.left), diameterOfBinaryTree(root.right))
        return max(d, h)
    }

    private func height(_ root: TreeNode?) -> Int {
        guard let root else { return 0 }
        let left = height(root.left) + 1
        let right = height(root.right) + 1
        return max(left, right)
    }
}
