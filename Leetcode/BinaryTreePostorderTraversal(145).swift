//
//  BinaryTreePostorderTraversal(145).swift
//  Leetcode
//
//  Created by Hiroki Minami on 2023-07-05.
//

import Foundation

/// `Binary Tree Postorder Traversal`
/// leetcode link: https://leetcode.com/problems/binary-tree-postorder-traversal/description/
/// O(n)
/// S(n)
func postorderTraversal(_ root: TreeNode?) -> [Int] {
  var result: [Int] = []
  
  func dfs(_ parent: TreeNode) {
    if let left = parent.left {
      dfs(left)
    }
    if let right = parent.right {
      dfs(right)
    }
    result.append(parent.val)
  }
  if let root = root {
    dfs(root)
  }
  return result
}
