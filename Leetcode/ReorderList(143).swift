//
//  ReorderList(143).swift
//  Leetcode
//
//  Created by Hiroki Minami on 2023-07-07.
//

import Foundation

/// `Reorder List`
/// leetcode link: https://leetcode.com/problems/reorder-list/
/// O(n) n + n/2
/// S(n) 3
func reorderList(_ head: ListNode?) {
  // append in an array
  var arr: [ListNode?] = []
  var curr = head
  
  while let node = curr {
    arr.append(curr)
    curr = node.next
  }
  
  let n = arr.count
  let isOdd = n % 2 == 1
  let half = n / 2
  for i in 0..<half {
    arr[i]?.next = arr[n-1-i]
    if i + 1 < half {
      arr[n-1-i]?.next = arr[i + 1]
    } else if isOdd {
      arr[n-1-i]?.next = arr[i + 1]
      arr[i + 1]?.next = nil
    } else {
      arr[i + 1]?.next = nil
    }
  }
}
