//
//  SummaryRanges(228).swift
//  Leetcode
//
//  Created by Hiroki Minami on 2023-07-05.
//

import Foundation

/// `Summary Ranges`
/// leetcode link: https://leetcode.com/problems/summary-ranges/
/// O(n)
/// S(n)
func summaryRanges(_ nums: [Int]) -> [String] {
  let n = nums.count
  var output: [String] = []
  var start = 0
  var i = 0
  
  while i < n {
    if i < n - 1 && nums[i+1] - nums[i] == 1 {
      i += 1
    } else if i > start {
      output.append("\(nums[start])->\(nums[i])")
      i += 1
      start = i
    } else {
      output.append("\(nums[i])")
      i += 1
      start = i
    }
  }
  
  return output
}
