//
//  SwapNodesinPairs(24).swift
//  Leetcode
//
//  Created by Hiroki Minami on 2023-06-23.
//

import Foundation

/// `Swap Nodes in Pairs`
/// leetcode link: https://leetcode.com/problems/swap-nodes-in-pairs/description/
/// O(n) => n/2
/// S(n) => n + n
func swapPairs(_ head: ListNode?) -> ListNode? {
  var current = head
  while let tempNode = current, let next = tempNode.next {
    let temp = tempNode.val
    tempNode.val = next.val
    next.val = temp
    current = next.next
  }
  return head
}

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}
