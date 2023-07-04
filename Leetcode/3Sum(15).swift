//
//  3Sum(15).swift
//  Leetcode
//
//  Created by Hiroki Minami on 2023-07-04.
//

import Foundation

/// `3Sum`
/// leetcode link: https://leetcode.com/problems/3sum/description/
/// O(n^2)  n^2 + logn
/// S(n) n + n + 2n
func threeSum(_ nums: [Int]) -> [[Int]] {
  var nums = nums.sorted(by: <)
  var result = Set<[Int]>()
  
  for i in 0..<nums.count {
    var j = i + 1
    var k = nums.count - 1
    while j < k {
      let sum = nums[i] + nums[j] + nums[k]
      if sum == 0 {
        result.insert([nums[i], nums[j], nums[k]])
        j += 1
        k -= 1
      } else if sum < 0 {
        j += 1
      } else {
        k -= 1
      }
    }
  }
  return Array(result)
}
