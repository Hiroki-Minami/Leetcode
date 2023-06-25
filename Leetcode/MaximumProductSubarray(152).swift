//
//  MaximumProductSubarray(152).swift
//  Leetcode
//
//  Created by Hiroki Minami on 2023-06-23.
//

import Foundation

/// `Maximum Product Subarray`
/// leetcode link: https://leetcode.com/problems/maximum-product-subarray/description/
/// O(n) => n * 4(max might use for loop in it)
/// S(n) =>  n + 3
func maxProduct(_ nums: [Int]) -> Int {
  var productMax = nums[0]
  
  var possibleMax = nums[0]
  var possibleMaxFromEnd = nums[nums.count-1]
  
  for i in 1..<nums.count {
    possibleMax *= nums[i]
    possibleMaxFromEnd *= nums[nums.count-i-1]
    
    if nums[i-1] == 0 { possibleMax = nums[i] }
    if nums[nums.count-i] == 0 { possibleMaxFromEnd = nums[nums.count-i-1] }
    productMax = max(possibleMax, nums[i], productMax, possibleMaxFromEnd)
  }
  return productMax
}
