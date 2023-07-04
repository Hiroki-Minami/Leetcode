//
//  LinkedListCycle(141).swift
//  Leetcode
//
//  Created by Hiroki Minami on 2023-07-04.
//

import Foundation

/// `Linked List Cycle`
/// leetcode link: https://leetcode.com/problems/linked-list-cycle/
/// O(n)
/// S(n)
func hasCycle(_ head: ListNode?) -> Bool {
  var turtle = head
  var rabit = head?.next
  
  while rabit != nil {
    guard turtle !== rabit else { return true }
    turtle = turtle?.next
    rabit = rabit?.next?.next
  }
  return false
}
