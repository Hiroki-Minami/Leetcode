//
//  BinaryTreePreorderTraversal(144).swift
//  Leetcode
//
//  Created by Hiroki Minami on 2023-07-05.
//

import Foundation

/// `Binary Tree Preorder Traversal`
/// leetcode link: https://leetcode.com/problems/binary-tree-preorder-traversal/description/
/// O(n)
/// S(n)
func preorderTraversal(_ root: TreeNode?) -> [Int] {
  var result: [Int] = []
  
  func dfs(_ parent: TreeNode) {
    result.append(parent.val)
    if let left = parent.left {
      dfs(left)
    }
    if let right = parent.right {
      dfs(right)
    }
  }
  if let root = root {
    dfs(root)
  }
  return result
}
