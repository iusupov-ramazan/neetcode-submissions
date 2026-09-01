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
    func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
        var queue = [root]
        var result: [Int] = []
        func dfs(_ root: TreeNode?, _ index: Int) {
            guard let root else { return }
            result.append(root.val)
            dfs(root.left, index + 1)
            dfs(root.right, index + 1)
        }   
        dfs(root, 0)
        result = result.sorted()
        print(result)
        return result.count > k - 1 ? result[k - 1] : -1
    }
}
