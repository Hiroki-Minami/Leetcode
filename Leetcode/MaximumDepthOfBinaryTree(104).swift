//
//  MaximumDepthOfBinaryTree(104).swift
//  Leetcode
//
//  Created by Hiroki Minami on 2023-07-07.
//

import Foundation

/// `Maximum Depth of Binary Tree`
/// leetcode link: https://leetcode.com/problems/maximum-depth-of-binary-tree/description/
/// O(n)
/// S(n)
func maxDepth(_ root: TreeNode?) -> Int {
  var maxDepth = 0
  func maxDepthHelper(_ node: TreeNode?, _ depth: Int) {
    guard let node = node else { return }
    maxDepth = max(maxDepth, depth)
    maxDepthHelper(node.left, depth + 1)
    maxDepthHelper(node.right, depth + 1)
  }
  maxDepthHelper(root, 1)
  return maxDepth
}
