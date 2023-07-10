//
//  KthSmallestElementInaBST(230).swift
//  Leetcode
//
//  Created by Hiroki Minami on 2023-07-09.
//

import Foundation

/// `Kth Smallest Element in a BST`
/// leetcode link: https://leetcode.com/problems/kth-smallest-element-in-a-bst/description/
/// O(n) n + logn
/// S(n)
func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
    var arr = [Int]()
    func traverse(_ node: TreeNode?) {
        guard let node = node else { return }
        arr.append(node.val)
        traverse(node.left)
        traverse(node.right)
    }
    traverse(root)
    arr.sort(by: <)
    return arr[k-1]
}
