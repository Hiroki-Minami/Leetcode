//
//  BinaryTreeLevelOrderTraversal(102).swift
//  Leetcode
//
//  Created by Hiroki Minami on 2023-07-07.
//

import Foundation

/// `Binary Tree Level Order Traversal`
/// leetcode link: https://leetcode.com/problems/binary-tree-level-order-traversal/description/
/// O(n)
/// S(n)
func levelOrder(_ root: TreeNode?) -> [[Int]] {
  var map: [Int: [Int]] = [:]
  var result: [[Int]] = []
  
  func traverse(_ node: TreeNode?, _ depth: Int) {
    guard let node = node else { return }
    map[depth, default: []].append(node.val)
    traverse(node.left, depth + 1)
    traverse(node.right, depth + 1)
  }
  
  traverse(root, 0)
  let keys = map.keys.sorted(by: <)
  for key in keys {
    if let value = map[key] {
      result.append(value)
    }
  }
  return result
}
