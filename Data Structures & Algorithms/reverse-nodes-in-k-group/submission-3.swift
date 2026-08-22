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

class Solution {
    func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
        var dummy = ListNode(0)
        dummy.next = head
        
        var groupPrev: ListNode? = dummy
        var curr = head

        while curr != nil {
            var tail = groupPrev
            for _ in 0..<k {
                tail = tail?.next
                if tail == nil {
                    return dummy.next
                }
            }

            let next = tail?.next
            tail?.next = nil

            let reversed = reverse(curr)

            groupPrev?.next = reversed
            curr?.next = next

            groupPrev = curr
            curr = next
            
        }
        return dummy.next
    }

    func reverse(_ head: ListNode?) -> ListNode? {
        var prev: ListNode? = nil
        var head = head
        while head != nil {
            let next = head?.next
            head?.next = prev
            prev = head
            head = next
        }
        return prev
    }
}
