//
//  MergeSortedArray(88).swift
//  Leetcode
//
//  Created by Hiroki Minami on 2023-07-04.
//

import Foundation

/// `Merge Sorted Array`
/// leetcode link: https://leetcode.com/problems/merge-sorted-array/description/
/// O(logn)
/// S(n) n + 1
func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
  let nums1Last = min(m, nums1.count)
  nums1 = Array(nums1[0..<nums1Last] + nums2)
  nums1.sort(by: <)
}
