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

    func rightSideView(_ root: TreeNode?) -> [Int] {
        var result: [Int] = []
        func dfs(_ root: TreeNode?, _ depth: Int) {
            guard let root else { return }
            if depth == result.count {
                result.append(root.val)
            }
            dfs(root.right, depth + 1)
            dfs(root.left, depth + 1)
        }
        dfs(root, 0)
        return result
    }
}