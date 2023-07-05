//
//  MissingNumber(268).swift
//  Leetcode
//
//  Created by Hiroki Minami on 2023-07-04.
//

import Foundation

/// `Missing Number`
/// leetcode link: https://leetcode.com/problems/missing-number/description/
/// O(n) n + logn
/// S(n) 2n
func missingNumber(_ nums: [Int]) -> Int {
  let sorted = nums.sorted(by: <)
  for (i, num) in sorted.enumerated() {
    if i != num { return i }
  }
  return nums.count
}
