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
    func goodNodes(_ root: TreeNode?) -> Int {
        var counter = 0

        func dfs(_ root: TreeNode?, _ val: Int) {
            guard let root else { return }
            if root.val >= val {
                counter += 1
            }
            dfs(root.left, max(root.val, val))
            dfs(root.right, max(root.val, val))
        }
        dfs(root, Int.min)
        return counter
    }
}
