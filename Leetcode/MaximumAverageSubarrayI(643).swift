//
//  MaximumAverageSubarrayI(643).swift
//  Leetcode
//
//  Created by Hiroki Minami on 2023-10-22.
//

import Foundation

/// `Maximum Average Subarray I`
/// leetcode link: https://leetcode.com/problems/maximum-average-subarray-i/
/// O(n)
/// S(n)
func findMaxAverage(_ nums: [Int], _ k: Int) -> Double {
    var sum = nums[0..<k].reduce(0, +)
    var maxAverage = Double(sum) / Double(k)
    
    for i in k..<nums.count {
        sum -= nums[i-k]
        sum += nums[i]
        maxAverage = max(maxAverage, Double(sum) / Double(k))
    }
    return maxAverage
}
