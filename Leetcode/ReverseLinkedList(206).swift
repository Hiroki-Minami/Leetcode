//
//  ReverseLinkedList(206).swift
//  Leetcode
//
//  Created by Hiroki Minami on 2023-07-06.
//

import Foundation

/// `Reverse Linked List`
/// leetcode link: https://leetcode.com/problems/reverse-linked-list/description/
/// O(n)
/// S(n)
func reverseList(_ head: ListNode?) -> ListNode? {
  guard let head = head else { return nil }
  
  var prev: ListNode? = nil
  var curr: ListNode? = head
  var next: ListNode? = curr?.next
  
  while curr != nil {
    next = curr?.next
    curr?.next = prev
    prev = curr
    curr = next
  }
  return prev
}
