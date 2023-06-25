//
//  FindMinimuminRotatedSortedArray(153).swift
//  Leetcode
//
//  Created by Hiroki Minami on 2023-06-23.
//

import Foundation

/// `Find Minimum in Rotated Sorted Array`
/// leetcode link: https://leetcode.com/problems/find-minimum-in-rotated-sorted-array/
/// O(log n)
/// S(log n) =>  2 + log n
func findMin(_ nums: [Int]) -> Int {
  var start = 0
  var end = nums.count - 1
  
  while start < end {
    let mid = (start + end) / 2
    if nums[mid] > nums[mid+1] { return nums[mid+1] }
    
    if nums[mid] < nums[end] {
      end = mid
    } else if nums[mid] > nums[start] {
      start = mid
    }
  }
  if start == 0 {
    return start
  } else {
    return end
  }
}
