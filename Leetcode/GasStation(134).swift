//
//  GasStation(134).swift
//  Leetcode
//
//  Created by Hiroki Minami on 2023-07-04.
//

import Foundation

/// `Gas Station`
/// leetcode link: https://leetcode.com/problems/gas-station/
/// O(n) 2n + n
/// S(n) 2n + n + 2
func canCompleteCircuit(_ gas: [Int], _ cost: [Int]) -> Int {
    if gas.reduce(0, +) < cost.reduce(0, +) { return -1 }

    var total = 0
    var index = 0

    for i in 0..<gas.count {
        total += gas[i] - cost[i]
        if total < 0 {
            total = 0
            index = i + 1
        }
    }
    return index
}
