//
//  LongestIncreasingSubsequence(300).swift
//  Leetcode
//
//  Created by Hiroki Minami on 2023-06-23.
//

import Foundation

/// `Longest Increasing Subsequence`
/// leetcode link: https://leetcode.com/problems/longest-increasing-subsequence/
/// O(n^2) => n^2 + n
/// S(n)
func lengthOfLIS(_ nums: [Int]) -> Int {
  var dp = [Int](repeating: 1, count: nums.count)
  
  for i in 1..<nums.count {
    for j in 0..<i {
      if nums[i] > nums[j] {
        dp[i] = max(dp[i], dp[j] + 1)
      }
    }
  }
  return dp.max()!
}
