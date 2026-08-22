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
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        var dummy = ListNode(0)
        // [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
        dummy.next = head
        // [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
        var left: ListNode? = dummy
        // [1, 2, 3, 4, 5, 6, 7, 8, 9]
        var right = head
        var n = n
        while n > 0 && right != nil {
            // [2, 3, 4, 5, 6, 7, 8, 9]
            // [3, 4, 5, 6, 7, 8, 9]
            // [4, 5, 6, 7, 8, 9]
            // [5, 6, 7, 8, 9]
            right = right?.next
            n -= 1
        }
        while right != nil {
            // [2, 3, 4, 5, 6, 7, 8, 9]
            // [3, 4, 5, 6, 7, 8, 9]
            // [4, 5, 6, 7, 8, 9]
            // [5, 6, 7, 8, 9]
            left = left?.next
            // [6, 7, 8, 9]
            // [7, 8, 9]
            // [8, 9]
            // [9]
            right = right?.next
        }
        // [5, 6, 7, 8, 9] -> // [5, 7, 8, 9]
        left?.next = left?.next?.next
        // [1, 2, 3, 4, 5, 7, 8, 9]
        return dummy.next
    }
}