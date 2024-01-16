//
//  SpiralMatrixIV(2326).swift
//  Leetcode
//
//  Created by Hiroki Minami on 2024-01-14.
//

import Foundation

/// `Spiral Matrix IV`
/// leetcode link: https://leetcode.com/problems/spiral-matrix-iv/description/
/// O(n)
/// S(n)

func spiralMatrix(_ m: Int, _ n: Int, _ head: ListNode?) -> [[Int]] {
    var answer: [[Int]] = [[Int]](repeating: [Int](repeating: -1, count: n), count: m)
    var visited: [[Bool]] = [[Bool]](repeating: [Bool](repeating: false, count: n), count: m)
    var cur = head
    
    let dSet: [(Int, Int)] = [
        (0, 1),
        (1, 0),
        (0, -1),
        (-1, 0)
    ]
    var selectedD = 0
    var y = 0
    var x = 0
    
    while let node = cur {
        answer[y][x] = node.val
        visited[y][x] = true
        let ny = y + dSet[selectedD].0
        let nx = x + dSet[selectedD].1
        
        if ny < m && ny >= 0 && nx < n && nx >= 0 && visited[ny][nx] {
            y = ny
            x = nx
        } else {
            selectedD += 1
            selectedD %= 4
            y = y + dSet[selectedD].0
            x = x + dSet[selectedD].1
        }
        cur = node.next
    }
    return answer
}
