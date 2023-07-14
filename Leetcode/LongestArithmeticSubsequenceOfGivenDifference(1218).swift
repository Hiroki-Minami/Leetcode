//
//  LongestArithmeticSubsequenceOfGivenDifference(1218).swift
//  Leetcode
//
//  Created by Hiroki Minami on 2023-07-14.
//

import Foundation

/// `Longest Arithmetic Subsequence of Given Difference`
/// leetcode link: https://leetcode.com/problems/longest-arithmetic-subsequence-of-given-difference/description/
/// O(n)
/// S(n)
func longestSubsequence(_ arr: [Int], _ difference: Int) -> Int {
    var dp: [Int: Int] = [:]

    for num in arr {
        dp[num] = dp[num - difference, default: 0] + 1
    }
    return dp.values.max() ?? 0
}
