//
//  SubtreeOfAnotherTree(572).swift
//  Leetcode
//
//  Created by Hiroki Minami on 2023-07-04.
//

import Foundation

/// `Subtree of Another Tree`
/// leetcode link: https://leetcode.com/problems/subtree-of-another-tree/
/// O(n^2)
/// S(n^2)
func isSubtree(_ root: TreeNode?, _ subRoot: TreeNode?) -> Bool {
  if root == nil { return false }
  if check(root, subRoot) { return true }
  return isSubtree(root!.left, subRoot) || isSubtree(root!.right, subRoot)
}

func check(_ root: TreeNode?, _ root2: TreeNode?) -> Bool {
  if root == nil && root2 == nil { return true }
  if let root = root, let root2 = root2, root.val == root2.val {
    return check(root.left, root2.left) && check(root.right, root2.right)
  } else {
    return false
  }
}

public class TreeNode {
  public var val: Int
  public var left: TreeNode?
  public var right: TreeNode?
  public init() { self.val = 0; self.left = nil; self.right = nil; }
  public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
  public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
    self.val = val
    self.left = left
    self.right = right
  }
}
