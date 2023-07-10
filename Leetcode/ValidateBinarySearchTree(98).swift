//
//  ValidateBinarySearchTree(98).swift
//  Leetcode
//
//  Created by Hiroki Minami on 2023-07-08.
//

import Foundation

/// `Validate Binary Search Tree`
/// leetcode link: https://leetcode.com/problems/validate-binary-search-tree/description/
/// O(n)
/// S(n)
func isValidBST(_ root: TreeNode?) -> Bool {
  guard let rootNode = root else { return true }
  
  func isValidBSTHelper(_ node: TreeNode?, _ maxVal: Int?, _ minVal: Int?) -> Bool {
    guard let node = node else { return true }
    if let maxVal = maxVal, node.val >= maxVal { return false }
    if let minVal = minVal, node.val <= minVal { return false }
    
    return isValidBSTHelper(node.left, node.val, minVal) && isValidBSTHelper(node.right, maxVal, node.val)
  }
  
  return isValidBSTHelper(root, nil, nil)
}
