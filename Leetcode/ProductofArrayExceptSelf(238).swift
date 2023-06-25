//
//  ProductofArrayExceptSelf(238).swift
//  Leetcode
//
//  Created by Hiroki Minami on 2023-06-23.
//

import Foundation

/// `Product of Array Except Self`
/// leetcode link: https://leetcode.com/problems/product-of-array-except-self/description/
/// O(n) => 2n
/// S(n) => n + 2
func productExceptSelf(_ nums: [Int]) -> [Int] {
  let n = nums.count
  var output = [Int](repeating: 1, count: n)
  
  // calculate right side of each
  var right = 1
  for i in 0..<n-1 {
    right *= nums[i]
    output[i+1] = right
  }
  
  // calculate left side of each
  var left = 1
  for i in 0..<n-1 {
    left *= nums[n-i-1]
    output[n-i-2] *= left
  }
  return output
}
