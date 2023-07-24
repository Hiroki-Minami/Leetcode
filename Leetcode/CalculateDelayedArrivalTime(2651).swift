//
//  CalculateDelayedArrivalTime(2651).swift
//  Leetcode
//
//  Created by Hiroki Minami on 2023-07-24.
//

import Foundation

/// `Calculate Delayed Arrival Time`
/// leetcode link: https://leetcode.com/problems/calculate-delayed-arrival-time/description/
/// O(1)
/// S(1) 2
func findDelayedArrivalTime(_ arrivalTime: Int, _ delayedTime: Int) -> Int {
  return (arrivalTime + delayedTime) % 24
}
