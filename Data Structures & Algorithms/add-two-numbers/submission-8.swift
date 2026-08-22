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
        var l1 = l1
        var l2 = l2
        var add = 0
        while l1 != nil || l2 != nil || add != 0 {
            let val1 = l1?.val ?? 0
            let val2 = l2?.val ?? 0
            let sum = val1 + val2 + add
            add = sum / 10
            curr?.next = ListNode(sum % 10)
            l1 = l1?.next
            l2 = l2?.next
            curr = curr?.next
        }
        return dummy.next
    }
}
