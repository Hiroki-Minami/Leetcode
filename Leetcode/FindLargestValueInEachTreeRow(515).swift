//
//  FindLargestValueInEachTreeRow(515).swift
//  Leetcode
//
//  Created by Hiroki Minami on 2023-10-29.
//

import Foundation

/// `Find Largest Value in Each Tree Row`
/// leetcode link: https://leetcode.com/problems/find-largest-value-in-each-tree-row/
/// O(n)
/// S(n)
func largestValues(_ root: TreeNode?) -> [Int] {
    if root == nil { return [] }
    var map: [Int: Int] = [:]
    var maxDepth = 0
    
    func dfs(_ current: TreeNode?, _ depth: Int) {
        guard let node = current else {
            return
        }
        map[depth] = map[depth] == nil ? node.val:
        max(map[depth]!, node.val)
        maxDepth = max(maxDepth, depth)
        
        dfs(node.left, depth + 1)
        dfs(node.right, depth + 1)
    }
    dfs(root, 0)
    
    var ret: [Int] = []
    for i in 0...maxDepth {
        ret.append(map[i]!)
    }
    return ret
}
