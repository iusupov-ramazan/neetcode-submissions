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
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        if p == nil && q == nil { return true }
        guard let p, let q else { return false }
        let isEqual = p.val == q.val
        let isLeftEqual = isSameTree(p.left, q.left)
        let isRightEqual = isSameTree(p.right, q.right)
        return isEqual && isLeftEqual &&  isRightEqual
    }
}
