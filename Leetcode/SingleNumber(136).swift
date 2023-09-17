//
//  SingleNumber(136).swift
//  Leetcode
//
//  Created by Hiroki Minami on 2023-09-11.
//

import Foundation

/// `Single Number`
/// leetcode link: https://leetcode.com/problems/single-number/
/// O(n)
/// S(2n)
func singleNumber(_ nums: [Int]) -> Int {
    var dict: [Int: Int] = [:]
    var set: Set<Int> = Set()
    
    for num in nums {
        dict[num] = dict[num, default: 0] + 1
        if dict[num]! > 1 {
            set.remove(num)
        } else {
            set.insert(num)
        }
    }
    return set.first!
}
