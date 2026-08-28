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
        var queue = [root]
        var headIndex = 0
        var result: [Int] = []

        while headIndex < queue.count {
            let levelSize = queue.count - headIndex
            print(queue.map { $0?.val })
            print(headIndex)
            print(levelSize)
            print()
            for i in 0..<levelSize {
                if let node = queue[headIndex] {
                    if i == levelSize - 1 { 
                        result.append(node.val)
                    }
                    if let left = node.left { queue.append(left) }
                    if let right = node.right { queue.append(right) }
                }
                headIndex += 1
            }
        }

        return result
    }
}
