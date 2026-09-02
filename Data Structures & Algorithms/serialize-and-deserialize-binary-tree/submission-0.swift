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

class Codec {

    // Encodes a tree to a single string.
    func serialize(_ root: TreeNode?) -> String {
        var result = String()
        func dfs(_ root: TreeNode?) {
            guard let root else { 
                result.append("n,")
                return
            }
            result.append(String(root.val) + ",")
            dfs(root.left)
            dfs(root.right)
        }
        dfs(root)
        return result
    }

    // Decodes your encoded data to tree.
    func deserialize(_ data: String) -> TreeNode? {
        let list = data.split(separator: ",")
        var i = 0

        func dfs() -> TreeNode? {
            if list[i] == "n" {
                i += 1
                return nil
            }
            let node = TreeNode(Int(String(list[i]))!)
            i += 1
            node.left = dfs()
            node.right = dfs()
            return node
        }
        return dfs()
    }
}
