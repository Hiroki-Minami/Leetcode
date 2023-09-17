//
//  RotateArray(189).swift
//  Leetcode
//
//  Created by Hiroki Minami on 2023-09-11.
//

import Foundation

/// `Rotate Array`
/// leetcode link: https://leetcode.com/problems/rotate-array/
/// O(k)
/// S(k)
func rotate(_ nums: inout [Int], _ k: Int) {
    var temp = 0
    for _ in 0..<k {
        temp = nums.removeLast()
        nums.insert(temp, at: 0)
    }
}
