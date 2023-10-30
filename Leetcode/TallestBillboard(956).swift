//
//  TallestBillboard.swift
//  Leetcode
//
//  Created by Hiroki Minami on 2023-10-29.
//

import Foundation

func tallestBillboard(_ rods: [Int]) -> Int {
    var memo: [Int: Int] = [:]
    var set: Set<Int> = Set()
    var maximum = 0
    
    for rod in rods {
        memo[rod, default: 0] += 1
        if memo[rod]! >= 2 { maximum = max(maximum, rod) }
        
        var temp: [Int] = []
        for num in set {
            memo[num + rod, default: 0] += 1
            if memo[num + rod]! >= 2 { maximum = max(maximum, num + rod) }
            temp.append(num + rod)
        }
        set.formUnion(temp)
        set.insert(rod)
    }
    print(set)
    print(memo)
    return maximum
}
