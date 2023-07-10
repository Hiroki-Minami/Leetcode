//
//  MinimumDepthOfBinaryTree(111).swift
//  Leetcode
//
//  Created by Hiroki Minami on 2023-07-09.
//

import Foundation

/// `Minimum Depth of Binary Tree`
/// leetcode link: https://leetcode.com/problems/minimum-depth-of-binary-tree/
/// O(n)
/// S(n)
func minDepth(_ root: TreeNode?) -> Int {
  guard let rootNode = root else { return 0 }
  var leafDepth = Int.max
  
  func traverse(_ node: TreeNode?, _ depth: Int) {
    guard let node = node else { return }
    
    if node.left == nil && node.right == nil {
      leafDepth = min(leafDepth, depth)
    }
    traverse(node.left, depth + 1)
    traverse(node.right, depth + 1)
  }
  traverse(root, 1)
  return leafDepth
}
