/**
 * Definition for singly-linked list.
 * class ListNode {
 *     var val: Int
 *     var next: ListNode?
 *     init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */

extension ListNode: CustomDebugStringConvertible {
    var debugDescription: String {
        return "\(val) -> \(next?.debugDescription ?? "nil")"
    }
}

class Solution {
    func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
        var dummy = ListNode(0)
        dummy.next = head

        var curr = head
        var prevGroup: ListNode? = dummy

        while curr != nil {
            var tail = prevGroup
            for _ in 0..<k {
                tail = tail?.next
                if tail == nil {
                    return dummy.next
                }
            }

            let next = tail?.next
            tail?.next = nil

            prevGroup?.next = reverse(curr)
            curr?.next = next

            prevGroup = curr
            curr = next
        }
        return dummy.next
    }

    private func reverse(_ head: ListNode?) -> ListNode? {
        var prev: ListNode? = nil
        var curr = head
        while curr != nil {
            let next = curr?.next
            curr?.next = prev
            prev = curr
            curr = next
        }
        return prev
    }
}
