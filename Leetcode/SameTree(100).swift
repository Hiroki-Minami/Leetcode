//
//  SameTree(100).swift
//  Leetcode
//
//  Created by Hiroki Minami on 2023-07-07.
//

import Foundation

/// `Same Tree`
/// leetcode link: https://leetcode.com/problems/same-tree/description/
/// O(n)
/// S(n)
func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
  // one nil but else not nil false
  if (p != nil && q == nil) || (p == nil && q != nil) { return false }
  guard let p = p, let q = q else { return true }
  
  if p.val != q.val { return false }
  
  // if the val is different false
  let left = isSameTree(p.left, q.left)
  let right = isSameTree(p.right, q.right)
  
  return left && right
}
