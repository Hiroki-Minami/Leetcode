//
//  PartitionArrayIntoDisjointIntervals(915).swift
//  Leetcode
//
//  Created by Hiroki Minami on 2023-10-22.
//

import Foundation

/// `Partition Array into Disjoint Intervals`
/// leetcode link: https://leetcode.com/problems/partition-array-into-disjoint-intervals/
/// O(n)
/// S(n)
func partitionDisjoint(_ nums: [Int]) -> Int {
    var maxLeft = nums[0]
    var maxTemp = nums[0]
    var partition = 1
    
    for i in 1..<nums.count {
        if maxLeft > nums[i] {
            partition = i + 1
            maxLeft = maxTemp
        } else if maxLeft < nums[i] {
            maxTemp = max(maxTemp, nums[i])
        }
    }
    return partition
}
