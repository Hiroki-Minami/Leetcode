//
//  AllNodesDistanceKInBinaryTree(863).swift
//  Leetcode
//
//  Created by Hiroki Minami on 2023-07-10.
//

import Foundation

/// `All Nodes Distance K in Binary Tree`
/// leetcode link: https://leetcode.com/problems/all-nodes-distance-k-in-binary-tree/description/
/// O(n) n + n
/// S(n)
func distanceK(_ root: TreeNode?, _ target: TreeNode?, _ k: Int) -> [Int] {
    guard let target = target else { return [] }
    var adjList: [Int: [Int]] = [:]

    func makeAdjList(_ curr: TreeNode?, _ parent: Int?) {
        guard let node = curr else { return }

        if let parent = parent {
            adjList[parent, default: []].append(node.val)
            adjList[node.val, default: []].append(parent)
        }
        makeAdjList(node.left, curr?.val)
        makeAdjList(node.right, curr?.val)
    }

    makeAdjList(root, nil)
    var ret = [Int]()
    let targetVal = target.val
    var visited = Set<Int>()

    func traverseFromTarget(_ curr: Int, _ distance: Int) {
        if distance == k {
            ret.append(curr)
            return
        }
        visited.insert(curr)
        guard let adj = adjList[curr] else { return }
        for next in adj {
            if !visited.contains(next) {
                traverseFromTarget(next, distance + 1)
            }
        }
    }
    
    traverseFromTarget(targetVal, 0)
    return ret
}
