//
//  TwoSum(1).swift
//  Leetcode
//
//  Created by Hiroki Minami on 2023-06-23.
//

import Foundation

/// `Two Sum`
/// leetcode link: https://leetcode.com/problems/two-sum/
/// O(n)
/// S(n)
func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
  var map: [Int: [Int]] = [:]
  for (i, num) in nums.enumerated() {
    var temp = target - num
    if let pair = map[temp] { return [pair[0], i] }
    map[num, default: []].append(i)
  }
  return []
}
