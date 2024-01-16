//
//  CheckIfNAndItsDoubleExist(1346).swift
//  Leetcode
//
//  Created by Hiroki Minami on 2023-11-12.
//

import Foundation

/// `Check If N and Its Double Exist`
/// leetcode link: https://leetcode.com/problems/check-if-n-and-its-double-exist/
/// O(n)
/// S(n)
func checkIfExist(_ arr: [Int]) -> Bool {
    var set: Set<Int> = Set()
    
    for num in arr {
        if num % 2 == 0 && set.contains(num / 2) { return true }
        if set.contains(num * 2) { return true }
        set.insert(num)
    }
    return false
}
