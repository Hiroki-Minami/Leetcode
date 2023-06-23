//
//  ContainsDuplicate(217).swift
//  Leetcode
//
//  Created by Hiroki Minami on 2023-06-23.
//

import Foundation

/// `Contains Duplicate`
/// leetcode link: https://leetcode.com/problems/contains-duplicate/description/
/// O(n)
/// S(n)
func containsDuplicate(_ nums: [Int]) -> Bool {
  var appeared = Set<Int>()
  for num in nums {
    if appeared.contains(num) { return true }
    appeared.insert(num)
  }
  return false
}
