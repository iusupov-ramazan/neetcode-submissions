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
        let dummy = ListNode(0)
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
    
           let nextGroupHead = tail?.next
           tail?.next = nil

           let reversedHead = reverse(curr)

           groupPrev?.next = reversedHead
           curr?.next = nextGroupHead

           groupPrev = curr
           curr = nextGroupHead
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
