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
    func isSubtree(_ root: TreeNode?, _ subRoot: TreeNode?) -> Bool {
        if subRoot == nil { return true }
        if isSameTree(root, subRoot) { return true }
        if root == nil { return false }
        return isSubtree(root?.left, subRoot) || isSubtree(root?.right, subRoot)
    }

    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        if p == nil && q == nil { return true }
        guard let p, let q, p.val == q.val else { return false }
        return isSameTree(p.left, q.left) && isSameTree(p.right, q.right)
    }
}
