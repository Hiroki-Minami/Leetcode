//
//  InvertBinaryTree(226).swift
//  Leetcode
//
//  Created by Hiroki Minami on 2023-07-04.
//

import Foundation

/// `Invert Binary Tree`
/// leetcode link: https://leetcode.com/problems/invert-binary-tree/description/
/// O(n)
/// S(n) 2n
@discardableResult
func invertTree(_ root: TreeNode?) -> TreeNode? {
  if root == nil { return nil }
  
  let left = root?.left
  let right = root?.right
  invertTree(left)
  invertTree(right)
  root?.left = right
  root?.right = left
  
  return root
}
