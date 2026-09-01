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
    var preIndex = 0
    var dict: [Int: Int] = [:]
    
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        
        for (i, v) in inorder.enumerated() {
            dict[v] = i
        }
        return dfs(preorder, 0, inorder.count - 1)
    }
        func dfs(_ preorder: [Int], _ left: Int, _ right: Int) -> TreeNode? {
            if left > right {
                return nil
            }
            let rootVal = preorder[preIndex]
            preIndex += 1
            let root = TreeNode(rootVal)
            let mid = dict[rootVal]!

            root.left = dfs(preorder, left, mid - 1)
            root.right = dfs(preorder, mid + 1, right)

            return root
    }
}
