//
//  SumOfLeftLeaves(404).swift
//  Leetcode
//
//  Created by Hiroki Minami on 2023-10-01.
//

import Foundation

/// `Sum of Left Leaves`
/// leetcode link: https://leetcode.com/problems/sum-of-left-leaves/description/
/// O(n)
/// S(n)
func sumOfLeftLeaves(_ root: TreeNode?) -> Int {
    func helper(_ left: TreeNode?, _ right: TreeNode?, _ isLeft: Bool, _ val: Int) -> Int {
        if left == nil && right == nil {
            return isLeft ? val: 0
        }
        var leftRet = 0
        var rightRet = 0
        if let left = left {
            leftRet = helper(left.left, left.right, true, left.val)
        }
        
        if let right = right {
            rightRet = helper(right.left, right.right, false, right.val)
        }
        return leftRet + rightRet
    }
    return helper(root?.left, root?.right, false, 0)
}
