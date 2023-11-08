//
//  ShortestDistanceToACharacter(821).swift
//  Leetcode
//
//  Created by Hiroki Minami on 2023-11-05.
//

import Foundation

/// `Shortest Distance to a Character`
/// leetcode link: https://leetcode.com/problems/shortest-distance-to-a-character/submissions/
/// O(n)
/// S(n)
func shortestToChar(_ s: String, _ c: Character) -> [Int] {
    var ret = [Int](repeating: 0, count: s.count)
    var closestC = Int.max
    // Forward
    for i in 0..<s.count {
        let ch = s[s.index(s.startIndex, offsetBy: i)]
        if ch == c {
            closestC = i
        }
        ret[i] = closestC != Int.max ? i - closestC: Int.max
    }
    
    // Backward
    closestC = Int.max
    for i in stride(from: s.count - 1, through: 0, by: -1) {
        let ch = s[s.index(s.startIndex, offsetBy: i)]
        if ch == c {
            closestC = i
        }
        ret[i] = min(ret[i], closestC - i)
    }
    return ret
}

