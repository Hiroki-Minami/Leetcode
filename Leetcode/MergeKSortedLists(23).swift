//
//  MergeKSortedLists(23).swift
//  Leetcode
//
//  Created by Hiroki Minami on 2023-07-06.
//

import Foundation

/// `Merge k Sorted Lists`
/// leetcode link: https://leetcode.com/problems/merge-k-sorted-lists/description/
/// O(n)
/// S(n)
func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
  guard !lists.isEmpty else { return nil }
  guard lists.count > 1 else { return lists[0] }
  
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
  
  var mergedList = lists[0]
  for i in 1..<lists.count {
    mergedList = mergeTwoLists(mergedList, lists[i])
  }
  return mergedList
}
