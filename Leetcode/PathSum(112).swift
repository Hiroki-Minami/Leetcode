//
//  PathSum(112).swift
//  Leetcode
//
//  Created by Hiroki Minami on 2023-11-19.
//

import Foundation

func hasPathSum(_ root: TreeNode?, _ targetSum: Int) -> Bool {
    
    func dfs(_ current: TreeNode?, _ sum: Int) -> Bool {
        guard let node = current else { return false }
        
        if node.right == nil && node.left == nil {
            return sum + node.val == targetSum
        }
        
        let left = dfs(current?.left, sum + current!.val)
        let right = dfs(current?.right, sum + current!.val)
        
        return left || right
    }
    if root == nil { return false }
    return dfs(root, 0)
}
