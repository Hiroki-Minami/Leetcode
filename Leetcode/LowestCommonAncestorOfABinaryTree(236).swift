//
//  LowestCommonAncestorOfABinaryTree(236).swift
//  Leetcode
//
//  Created by Hiroki Minami on 2023-07-05.
//

import Foundation

/// `Lowest Common Ancestor of a Binary Tree`
/// leetcode link: https://leetcode.com/problems/lowest-common-ancestor-of-a-binary-tree/description/
/// O(n^2) n + n + n^2
/// S(n) 3n
func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
  
  guard p != nil && q != nil else { return nil }
  
  func dfs(_ start: TreeNode, _ target: TreeNode, _ candidates: inout [TreeNode]) {
    if visitedTarget { return }
    guard start.left != nil || start.right != nil else { return }
    
    if let left = start.left {
      if left === target {
        visitedTarget = true
        candidates.append(left)
        return
      }
      // push left as a candidate of ancestor
      candidates.append(left)
      dfs(left, target, &candidates)
      if visitedTarget { return }
      candidates.removeLast()
      
    }
    if let right = start.right {
      if right === target {
        visitedTarget = true
        candidates.append(right)
        return
      }
      // push right as a candidate of ancestor
      candidates.append(right)
      dfs(right, target, &candidates)
      if visitedTarget { return }
      candidates.removeLast()
    }
  }
  
  var visitedTarget = false
  var candidatesForP: [TreeNode] = [root!]
  dfs(root!, p!, &candidatesForP)
  
  visitedTarget = false
  var candidatesForQ: [TreeNode] = [root!]
  dfs(root!, q!, &candidatesForQ)
  
  for i in 1...candidatesForP.count {
    for j in 1...candidatesForQ.count {
      if candidatesForP[candidatesForP.count-i] === candidatesForQ[candidatesForQ.count-j] {
        return candidatesForP[candidatesForP.count-i]
      }
    }
  }
  return nil
}
