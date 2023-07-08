//
//  MergeTwoSortedLists(21).swift
//  Leetcode
//
//  Created by Hiroki Minami on 2023-07-06.
//

import Foundation

/// `Merge Two Sorted Lists`
/// leetcode link: https://leetcode.com/problems/merge-two-sorted-lists/description/
/// O(n) n + m n: length of list1, m: length of list2
/// S(n) n + m
func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
  guard let list1 = list1 else { return list2 }
  guard let list2 = list2 else { return list1 }
  
  if list1.val <= list2.val {
    list1.next = mergeTwoLists(list1.next, list2)
    return list1
  } else {
    list2.next = mergeTwoLists(list1, list2.next)
    return list2
  }
}
