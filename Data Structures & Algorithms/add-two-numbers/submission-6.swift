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
        let dummy = ListNode(0)
        var head: ListNode? = dummy
        var (l1, l2) = (l1, l2)
        var additionalValue = 0

        while l1 != nil || l2 != nil || additionalValue != 0 {
            let val1 = l1?.val ?? .zero
            let val2 = l2?.val ?? .zero
            let sum = val1 + val2 + additionalValue
            additionalValue = sum / 10
            let node = ListNode(sum % 10)
            head?.next = node
            head = head?.next
            l1 = l1?.next
            l2 = l2?.next
        }
        return dummy.next
    }
}
