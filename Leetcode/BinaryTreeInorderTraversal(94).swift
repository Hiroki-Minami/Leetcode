//
//  BinaryTreeInorderTraversal(94).swift
//  Leetcode
//
//  Created by Hiroki Minami on 2023-07-04.
//

import Foundation

/// `Binary Tree Inorder Traversal`
/// leetcode link: https://leetcode.com/problems/binary-tree-inorder-traversal/description/
/// O(n)
/// S(n)
func inorderTraversal(_ root: TreeNode?) -> [Int] {
  var result: [Int] = []
  
  func dfs(_ parent: TreeNode) {
    if let left = parent.left {
      dfs(left)
    }
    result.append(parent.val)
    if let right = parent.right {
      dfs(right)
    }
  }
  
  if let root = root {
    dfs(root)
  }
  return result
}
