//
//  ContainerWithMostWater(11).swift
//  Leetcode
//
//  Created by Hiroki Minami on 2023-07-04.
//

import Foundation

/// `Container With Most Water`
/// leetcode link: https://leetcode.com/problems/container-with-most-water/description/
/// O(n)
/// S(n) n + 3
func maxArea(_ height: [Int]) -> Int {
    var left = 0
    var right = height.count - 1

    var maximum = 0
    while left < right {
        let area = (right - left) * min(height[left], height[right])
        maximum = max(maximum, area)

        if height[left] <= height[right] {
            left += 1
        } else {
            right -= 1
        }
    }

    return maximum
}
