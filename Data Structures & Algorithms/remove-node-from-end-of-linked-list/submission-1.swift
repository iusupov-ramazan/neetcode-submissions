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
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        var dummy = ListNode(0)
        dummy.next = head
        var left: ListNode? = dummy
        var right = head
        var n = n
        while n > 0 && right != nil {
            right = right?.next
            n -= 1
        }

        while right != nil {
            left = left?.next
            right = right?.next
        }
        print(left?.debugDescription)
        left?.next = left?.next?.next
        print(left?.debugDescription)
        return dummy.next
    }
}
