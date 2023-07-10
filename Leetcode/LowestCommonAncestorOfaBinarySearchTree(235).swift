//
//  LowestCommonAncestorOfaBinarySearchTree(235).swift
//  Leetcode
//
//  Created by Hiroki Minami on 2023-07-09.
//

import Foundation

/// `Lowest Common Ancestor of a Binary Search Tree`
/// leetcode link: https://leetcode.com/problems/lowest-common-ancestor-of-a-binary-search-tree/description/
/// O(n) n + n
/// S(n) 3n + 6
func lowestCommonAncestor235(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
    var parents: [Int: Int] = [:] // [val: val]
    var depths: [Int: Int] = [:] // [node.val: depth]
    var valMap: [Int: TreeNode?] = [:] // [val: Node]

    func traverse(_ optionalNode: TreeNode?, _ parentVal: Int, _ depth: Int) {
        guard let node = optionalNode else { return }
        parents[node.val] = parentVal
        depths[node.val] = depth
        valMap[node.val] = optionalNode
        traverse(node.left, node.val, depth + 1)
        traverse(node.right, node.val, depth + 1)
    }
    traverse(root, root!.val, 0)

    let pDepth = depths[p!.val]!
    let qDepth = depths[q!.val]!

    var deeper = pDepth > qDepth ? pDepth: qDepth
    var deeperVal = pDepth > qDepth ? p!.val : q!.val
    let shallower = pDepth > qDepth ? qDepth: pDepth
    var shallowerVal = pDepth > qDepth ? q!.val : p!.val

    while shallower < deeper {
        deeperVal = parents[deeperVal]!
        deeper -= 1
    }

    while deeperVal != shallowerVal {
        deeperVal = parents[deeperVal]!
        shallowerVal = parents[shallowerVal]!
    }
    return valMap[shallowerVal]!
}
