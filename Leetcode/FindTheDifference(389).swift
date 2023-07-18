//
//  FindTheDifference(389).swift
//  Leetcode
//
//  Created by Hiroki Minami on 2023-07-16.
//

import Foundation

/// `Find the Difference`
/// leetcode link: https://leetcode.com/problems/find-the-difference/description/
/// O(n) logn + logn + n
/// S(n)
func findTheDifference(_ s: String, _ t: String) -> Character {
    let sSorted = s.sorted(by: <)
    let tSorted = t.sorted(by: <)

    let n = s.count

    let sStart = sSorted.startIndex
    let tStart = tSorted.startIndex

    for i in 0..<n {
        let sIndex = sSorted.index(sStart, offsetBy: i)
        let tIndex = tSorted.index(tStart, offsetBy: i)
        if sSorted[sIndex] != tSorted[tIndex] {
            return tSorted[tIndex]
        }
    }

    let tEnd = tSorted.index(tSorted.endIndex, offsetBy: -1)
    return tSorted[tEnd]
}
