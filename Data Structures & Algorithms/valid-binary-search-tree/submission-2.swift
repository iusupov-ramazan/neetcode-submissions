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
    func isValidBST(_ root: TreeNode?) -> Bool {
        return validate(root, min: nil, max: nil)
    }

    func validate(_ root: TreeNode?, min: Int?, max: Int?) -> Bool {
        guard let root else { return true }
        if let min, min >= root.val { return false }
        if let max, max <= root.val { return false }
        return validate(root.left, min: min, max: root.val) 
        && validate(root.right, min: root.val, max: max) 
    }
}
