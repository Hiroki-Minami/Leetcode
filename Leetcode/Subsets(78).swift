//
//  Subsets(78).swift
//  Leetcode
//
//  Created by Hiroki Minami on 2023-07-04.
//

import Foundation

/// `Subsets`
/// leetcode link: https://leetcode.com/problems/subsets/description/
/// O(n^2)
/// S(n) uncertain. depends on the length of nums
func subsets(_ nums: [Int]) -> [[Int]] {
  var results = [[Int]]()
  var candidate = [Int]()
  
  func subsetsHelper(_ additionalSelect: Int, _ from: Int) {
    if additionalSelect == 0 {
      results.append(candidate)
    } else {
      if from < nums.count {
        for i in from..<nums.count {
          candidate.append(nums[i])
          subsetsHelper(additionalSelect - 1, i + 1)
          candidate.removeLast()
        }
      }
    }
  }
  
  for i in 0...nums.count {
    subsetsHelper(i, 0)
  }
  return results
}
