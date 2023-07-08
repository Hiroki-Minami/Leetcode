//
//  RemoveNthNodeFromEndOfList(19).swift
//  Leetcode
//
//  Created by Hiroki Minami on 2023-07-06.
//

import Foundation

/// `Remove Nth Node From End of List`
/// leetcode link: https://leetcode.com/problems/remove-nth-node-from-end-of-list/description/
/// O(n) 2n
/// S(1) 3
func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
    var count = 0
    var curr = head
    var prev: ListNode? = nil

    while let node = curr {
        curr = node.next
        count += 1
    }
    count = count - n
    guard count != 0 else { return head?.next }

    curr = head
    for _ in 0..<count {
        prev = curr
        curr = curr?.next
    }

    prev?.next = curr?.next
    return head
}
