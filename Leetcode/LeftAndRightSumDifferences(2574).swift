//
//  LeftAndRightSumDifferences(2574).swift
//  Leetcode
//
//  Created by Hiroki Minami on 2024-01-14.
//

import Foundation

/// `Left and Right Sum Differences`
/// leetcode link: https://leetcode.com/problems/left-and-right-sum-differences/description/
/// O(n)
/// S(n)

func leftRightDifference(_ nums: [Int]) -> [Int] {
    let n = nums.count
    var leftSum = [Int](repeating: 0, count: n)
    var rightSum = [Int](repeating: 0, count: n)
    
    for i in 1..<n {
        leftSum[i] = leftSum[i - 1] + nums[i - 1]
        rightSum[n - i - 1] = rightSum[n - i] + nums[n - i]
    }
    
    for j in 0..<n {
        rightSum[j] = abs(leftSum[j] - rightSum[j]) 
    }
    
    return rightSum
}
