//
//  UnivaluedBinaryTree(965).swift
//  Leetcode
//
//  Created by Hiroki Minami on 2023-09-24.
//

import Foundation

/// `Univalued Binary Tree`
/// leetcode link: https://leetcode.com/problems/univalued-binary-tree/description/
/// O(n)
/// S(n)
func isUnivalTree(_ root: TreeNode?) -> Bool {
    guard let node = root else {
        return false
    }
    let value = node.val
    
    var queue: [TreeNode] = [node]
    while !queue.isEmpty {
        let cur = queue.removeLast()
        if cur.val != value {
            return false
        }
        if let left = cur.left {
            queue.append(left)
        }
        if let right = cur.right {
            queue.append(right)
        }
    }
    return true
}
