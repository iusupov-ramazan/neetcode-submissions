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
   func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        var currentLists = lists
        while currentLists.count > 1 {
            var mergedLists: [ListNode?] = []
            for i in stride(from: 0, to: currentLists.count, by: 2) {
                let l1 = currentLists[i]
                let l2 = i + 1 >= currentLists.count ? nil : currentLists[i + 1]
                let merged = mergeTwoLists(l1, l2)
                mergedLists.append(merged)
            }
            currentLists = mergedLists
        }

        return currentLists.first ?? nil
    }
    
    private func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    let dummy = ListNode(0)
    var current: ListNode? = dummy
    var (l1, l2) = (l1, l2)
    while l1 != nil && l2 != nil {
        let val1 = l1?.val ?? 0
        let val2 = l2?.val ?? 0
        if val1 < val2 {
            current?.next = l1
            l1 = l1?.next
        } else {
            current?.next = l2
            l2 = l2?.next
        }
        current = current?.next
    }
    current?.next = l1 ?? l2
    return dummy.next
}
}