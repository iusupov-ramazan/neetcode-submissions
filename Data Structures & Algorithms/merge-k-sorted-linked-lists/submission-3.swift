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
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        var currentList = lists
        while currentList.count > 1 {
            var mergedList: [ListNode?] = []
            for i in stride(from: 0, to: currentList.count, by: 2) {
                let l1 = currentList[i]
                let l2 = i + 1 < currentList.count ? currentList[i + 1] : nil
                let node = merge(l1, l2)
                mergedList.append(node)
            }
            currentList = mergedList
        }
        return currentList.first ?? nil
    }

    func merge(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        let dummy = ListNode(0)
        var curr: ListNode? = dummy
        var l1 = l1
        var l2 = l2
        while l1 != nil && l2 != nil {
            let val1 = l1!.val 
            let val2 = l2!.val 
            if val1 > val2 {
                curr?.next = l2
                l2 = l2?.next
            } else {
                curr?.next = l1
                l1 = l1?.next
            }
            curr = curr?.next
        } 
        curr?.next = l1 ?? l2
        return dummy.next
    } 
}
