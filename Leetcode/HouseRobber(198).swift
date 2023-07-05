//
//  HouseRobber(198).swift
//  Leetcode
//
//  Created by Hiroki Minami on 2023-07-05.
//

import Foundation

/// `House Robber`
/// leetcode link: https://leetcode.com/problems/house-robber/description/
/// O(n) 3n + 2n + n
/// S(n) n + n
func rob(_ nums: [Int]) -> Int {
  let n = nums.count
  var dp = [Int](repeating: 0, count: n)
  
  for i in 0..<n {
    if i >= 3 {
      dp[i] = max(dp[i-3] + nums[i], dp[i-2] + nums[i], dp[i-1])
    } else if i >= 2 {
      dp[i] = max(dp[i-2] + nums[i], dp[i-1])
    } else {
      dp[i] = nums[i]
    }
  }
  return dp.max()!
}
