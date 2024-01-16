//
//  DeleteLeavesWithAGivenValue(1325).swift
//  Leetcode
//
//  Created by Hiroki Minami on 2023-11-12.
//

import Foundation

/// `Delete Leaves With a Given Value`
/// leetcode link: https://leetcode.com/problems/delete-leaves-with-a-given-value/description/
/// O(n)
/// S(n)
func removeLeafNodes(_ root: TreeNode?, _ target: Int) -> TreeNode? {
    @discardableResult
    func isLeaf(_ current: TreeNode?) -> Bool {
        if current?.left == nil && current?.right == nil { return true }
        
        let left = isLeaf(current?.left)
        if left && current?.left?.val == target {
            current?.left = nil
        }
        
        let right = isLeaf(current?.right)
        if right && current?.right?.val == target {
            current?.right = nil
        }
        return current?.left == nil && current?.right == nil
    }
    isLeaf(root)
    return root?.val == target && root?.right == nil && root?.left == nil ? nil: root
}
