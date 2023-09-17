//
//  CombinationSum(39).swift
//  Leetcode
//
//  Created by Hiroki Minami on 2023-09-17.
//

import Foundation

/// `Combination Sum`
/// leetcode link: https://leetcode.com/problems/combination-sum/description/
/// O(expornential)
/// S(expornential)
func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
    var ret: [[Int]] = []
    
    func combinationSumHelper(_ remain: Int, _ lastIndex: Int, _ soFar: [Int]) {
        if remain < 0 { return }
        if remain == 0 {
            ret.append(soFar)
        }
        var soFar = soFar
        for (i, candidate) in candidates.enumerated() {
            if i < lastIndex { continue }
            soFar.append(candidate)
            combinationSumHelper(remain - candidate, i, soFar)
            soFar.removeLast()
        }
    }
    
    combinationSumHelper(target, 0, [])
    return ret
}
