//
//  Shift2DGrid(1260).swift
//  Leetcode
//
//  Created by Hiroki Minami on 2023-11-12.
//

import Foundation

/// `Shift 2D Grid`
/// leetcode link: https://leetcode.com/problems/shift-2d-grid/description/
/// O(n * m  * k)
/// S(n * m)
func shiftGrid(_ grid: [[Int]], _ k: Int) -> [[Int]] {
    var ret: [[Int]] = grid
    let row = grid.count
    let column = grid[0].count
    
    var temp = 0
    for _ in 0..<k {
        temp = ret[0][0]
        for i in 0..<row {
            for j in 0..<column {
                let fixedI = j == column - 1 ? (i + 1) % row: i
                let fixedJ = j == column - 1 ? 0: j + 1
                let temp2 = ret[fixedI][fixedJ]
                ret[fixedI][fixedJ] = temp
                temp = temp2
            }
        }
    }
    return grid
}
