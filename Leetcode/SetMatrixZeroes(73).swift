//
//  SetMatrixZeroes(73).swift
//  Leetcode
//
//  Created by Hiroki Minami on 2023-07-06.
//

import Foundation

/// `Set Matrix Zeroes`
/// leetcode link: https://leetcode.com/problems/set-matrix-zeroes/description/
/// O(m * n^2)  mn + mn * max(m, n)     matrix = n * m
/// S(m * n)
func setZeroes(_ matrix: inout [[Int]]) {
  let n = matrix.count
  let m = matrix[0].count
  let larger = max(m, n)
  
  var queue = [(y:Int, x:Int)]()
  var alteredX = Set<Int>()
  var alteredY = Set<Int>()
  
  for (y, row) in matrix.enumerated() {
    for (x, cell) in row.enumerated() {
      if cell == 0 { queue.append((y, x)) }
    }
  }
  
  for (y, x) in queue {
    if alteredX.contains(x) && alteredY.contains(y) { continue }
    for i in 0..<larger {
      let modifiedX = min(i, m - 1)
      let modifiedY = min(i, n - 1)
      matrix[y][modifiedX] = 0
      matrix[modifiedY][x] = 0
    }
    alteredX.insert(x)
    alteredY.insert(y)
  }
}
