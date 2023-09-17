//
//  MaximumProductOfThreeNumbers(628).swift
//  Leetcode
//
//  Created by Hiroki Minami on 2023-09-17.
//

import Foundation

/// `Maximum Product of Three Numbers`
/// leetcode link: https://leetcode.com/problems/maximum-product-of-three-numbers/
/// O(n * logn)
/// S(n)
func maximumProduct(_ nums: [Int]) -> Int {
    guard nums.count > 3 else { return nums.reduce(1, {$0 * $1}) }
    var maximum = Int.min
    
    var sorted = nums.sorted(by: >)
    let length = sorted.count
    maximum = max(maximum, sorted[0..<3].reduce(1, { $0 * $1 }))
    maximum = max(maximum, sorted[0] * sorted[(length - 2)..<length].reduce(1, { $0 * $1 }))
    
    return maximum
}
