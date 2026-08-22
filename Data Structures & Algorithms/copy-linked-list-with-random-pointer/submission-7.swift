/*
// Definition for a Node.
class Node {
    var val: Int
    var next: Node?
    var random: Node?
    init(_ val: Int) {
        self.val = val
        self.next = nil
        self.random = nil
    }
}
*/

class Solution {
    func copyRandomList(_ head: Node?) -> Node? {
        var dict: [Node?: Node?] = [:]
        var curr = head

        while curr != nil {
            let node = Node(curr!.val)
            dict[curr!] = node
            curr = curr?.next
        }

        curr = head
        while curr != nil {
            let node = dict[curr!] ?? nil
            node?.next = dict[curr?.next] ?? nil
            node?.random = dict[curr?.random] ?? nil
            curr = curr?.next
        }
        return dict[head] ?? nil
    }
}
