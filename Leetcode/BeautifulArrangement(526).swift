//
//  BeautifulArrangement(526).swift
//  Leetcode
//
//  Created by Hiroki Minami on 2024-01-15.
//

import Foundation

/// `Beautiful Arrangement`
/// leetcode link: https://leetcode.com/problems/beautiful-arrangement/description/
/// O(n^n)
/// S(n)

func countArrangement(_ n: Int) -> Int {
    var result = 0
    var used = Set<Int>()
    countArrangementHelper(n, &used, &result)
    return result
}

func countArrangementHelper(_ n: Int, _ used: inout Set<Int>, _ result: inout Int) {
    if used.count == n {
        result += 1
    } else {
        for i in 1...n {
            if !used.contains(i) &&
            (i % (used.count + 1) == 0 || (used.count + 1) % i == 0) {
                used.insert(i)
                countArrangementHelper(n, &used, &result)
                used.remove(i)
            }
        }
    }
}
