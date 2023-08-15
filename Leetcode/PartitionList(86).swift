//
//  PartitionList(86).swift
//  Leetcode
//
//  Created by Hiroki Minami on 2023-08-15.
//

import Foundation

/// `Partition List`
/// leetcode link: https://leetcode.com/problems/partition-list/
/// O(n) 2 * n
/// S(n) 
func partition(_ head: ListNode?, _ x: Int) -> ListNode? {
  
  var largerThanThreshould: [ListNode?] = []
  var previous: ListNode? = nil
  var current: ListNode? = head
  var newHead: ListNode? = nil
  
  while let node = current {
    if node.val < x {
      if newHead == nil {
        newHead = current
        previous = current
        current = node.next
        continue
      } else {
        previous?.next = current
        previous = current
        current = node.next
      }
    } else {
      largerThanThreshould.append(current)
      current = node.next
    }
  }
  
  for node in largerThanThreshould {
    if newHead == nil {
      newHead = node
      previous = node
    } else {
      previous?.next = node
      previous = node
    }
  }
  previous?.next = nil
  return newHead
}
