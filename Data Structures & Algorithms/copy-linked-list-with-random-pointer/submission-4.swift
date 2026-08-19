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

extension Node: CustomDebugStringConvertible {
    var debugDescription: String {
        return "\(val) -> \(next?.debugDescription ?? "nil")"
    }
}

class Solution {
    func copyRandomList(_ head: Node?) -> Node? {
        var dict: [Node?: Node?] = [:]
        var curr = head
        while curr != nil {
            dict[curr] = Node(curr!.val)
            curr = curr?.next
        }
        curr = head
        while curr != nil {
            let c = dict[curr]
            c??.next = dict[curr?.next] ?? nil
            c??.random = dict[curr?.random] ?? nil
            curr = curr?.next
        }
        return dict[head] ?? nil
    }
}
