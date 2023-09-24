//
//  TargetSum(494).swift
//  Leetcode
//
//  Created by Hiroki Minami on 2023-09-24.
//

import Foundation

/// `Target Sum`
/// leetcode link: https://leetcode.com/problems/target-sum/description/
/// O(2^n)
/// S(2^n)
func findTargetSumWays(_ nums: [Int], _ target: Int) -> Int {
    var result = 0
    func findTargetSumWasyHelper(_ soFar: Int, _ index: Int) {
        if index == nums.count {
            result = soFar == target ? result + 1: result
            return
        }
        findTargetSumWasyHelper(soFar + nums[index], index + 1)
        findTargetSumWasyHelper(soFar - nums[index], index + 1)
    }
    findTargetSumWasyHelper(0, 0)
    return result
}
