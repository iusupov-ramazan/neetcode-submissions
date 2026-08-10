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
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        var dummy = ListNode(1)
        var current: ListNode? = dummy
        var list1 = list1
        var list2 = list2
        while list1 != nil && list2 != nil {
            if (list1?.val ?? .zero) < (list2?.val ?? .zero) {
                current?.next = list1
                list1 = list1?.next
            } else {
                current?.next = list2
                list2 = list2?.next
            }
            current = current?.next
        }
        current?.next = list1 ?? list2
        return dummy.next
    }
}
