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
        var oldToCopy: [Node?: Node?] = [nil: nil]
        var curr = head
        while curr != nil {
            oldToCopy[curr] = Node(curr!.val)
            curr = curr?.next
        }
        curr = head
        while curr != nil {
            let copy = oldToCopy[curr]
            copy??.next = oldToCopy[curr?.next] ?? nil
            copy??.random = oldToCopy[curr?.random] ?? nil
            curr = curr?.next
        }
    
        return oldToCopy[head] ?? nil
    }
}
