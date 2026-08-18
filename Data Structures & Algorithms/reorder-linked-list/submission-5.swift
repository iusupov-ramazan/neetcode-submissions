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
    func reorderList(_ head: ListNode?) {
        var slow = head
        var fast = head?.next
        while fast != nil && fast?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
        }
        var second = slow?.next
        slow?.next = nil
        var prev: ListNode?
        var curr = second
        while curr != nil {
            let next = curr?.next
            curr?.next = prev
            prev = curr
            curr = next
        }
        var first = head
        second = prev
        while first != nil {
            let tmp = first?.next
            let tmp2 = second?.next
            first?.next = second
            second?.next = tmp

            first = tmp
            second = tmp2
        }
    }
}
