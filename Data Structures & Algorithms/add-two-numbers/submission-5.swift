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
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var dummy = ListNode(0)
        var curr: ListNode? = dummy
        var additional = 0
        var (l1, l2) = (l1, l2)
        while l1 != nil || l2 != nil || additional != 0 {
            let v1 = l1?.val ?? .zero
            let v2 = l2?.val ?? .zero
            let sum = v1 + v2 + additional
            additional = sum / 10
            curr?.next = ListNode(sum % 10)
            curr = curr?.next
            l1 = l1?.next
            l2 = l2?.next
        }
        return dummy.next
    }
}
