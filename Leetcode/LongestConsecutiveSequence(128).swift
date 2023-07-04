//
//  LongestConsecutiveSequence(128).swift
//  Leetcode
//
//  Created by Hiroki Minami on 2023-07-04.
//

import Foundation

/// `Longest Consecutive Sequence`
/// leetcode link: https://leetcode.com/problems/longest-consecutive-sequence/
/// O(n logn)
/// S(n) 2 + 2n
func longestConsecutive(_ nums: [Int]) -> Int {
  if nums.isEmpty { return 0 }
  var maximum = 0
  var current = 1
  let sorted = nums.sorted(by: <)
  for (i, num) in sorted.enumerated() {
    if i == 0 { continue }
    if num == sorted[i-1] { continue }
    if (num - sorted[i-1]) == 1 {
      current += 1
    } else {
      maximum = max(maximum, current)
      current = 1
    }
  }
  maximum = max(maximum, current)
  return maximum
}
