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
    func reverseList(_ head: ListNode?) -> ListNode? {
        guard head != nil else { return nil }

        var newHead = head
        print("Value here is: \(newHead?.val)")
        if let next = head?.next {
            newHead = reverseList(next)
            head?.next?.next = head
            print("New head here is: \(newHead?.val)")
            print("head?.next?.next = head here is: \(head?.val)")
        }
        head?.next = nil
        return newHead
    }
}