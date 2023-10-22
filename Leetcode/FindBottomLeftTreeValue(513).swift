//
//  FindBottomLeftTreeValue(513).swift
//  Leetcode
//
//  Created by Hiroki Minami on 2023-10-22.
//

import Foundation

/// `Find Bottom Left Tree Value`
/// leetcode link: https://leetcode.com/problems/find-bottom-left-tree-value/
/// O(n)
/// S(n)
func findBottomLeftValue(_ root: TreeNode?) -> Int {
    var memo: [Int: Int] = [:]
    var maxDepth = 0
    
    func dfs(_ current: TreeNode?, _ depth: Int) {
        guard let node = current else { return }
        maxDepth = max(maxDepth, depth)
        if memo[depth] == nil {
            memo[depth] = node.val
        }
        dfs(node.left, depth + 1)
        dfs(node.right, depth + 1)
    }
    
    dfs(root, 0)
    return memo[maxDepth]!
}
