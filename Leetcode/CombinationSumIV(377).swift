//
//  CombinationSumIV(377).swift
//  Leetcode
//
//  Created by Hiroki Minami on 2023-07-05.
//

import Foundation

/// `Combination Sum IV`
/// leetcode link: https://leetcode.com/problems/combination-sum-iv/description/
/// O(n) n * m n: target, m: the number of nums
/// S(n) n + n * m
func combinationSum4(_ nums: [Int], _ target: Int) -> Int {
  var memo: [Int: Int] = [:]
  memo[0] = 1
  
  func combinationSum4Helper(_ newTarget: Int) -> Int {
    if let calc = memo[newTarget] { return calc }
    var result = 0
    for num in nums {
      if newTarget >= num {
        let nextTarget = newTarget - num
        result += combinationSum4Helper(nextTarget)
      }
    }
    memo[newTarget] = result
    return result
  }
  return combinationSum4Helper(target)
}
