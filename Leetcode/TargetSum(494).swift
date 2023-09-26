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
    var memo: [String: Int] = [:]
    func findTargetSumWasyHelper(_ soFar: Int, _ index: Int) -> Int {
        let key = "\(index):\(soFar)"
        if let val = memo[key] { return val }
        if index == nums.count {
            return soFar == target ? 1: 0
        }
        let plus = findTargetSumWasyHelper(soFar + nums[index], index + 1)
        let minus = findTargetSumWasyHelper(soFar - nums[index], index + 1)
        memo[key] = plus + minus
        
        return plus + minus
    }
    return findTargetSumWasyHelper(0, 0)
}
