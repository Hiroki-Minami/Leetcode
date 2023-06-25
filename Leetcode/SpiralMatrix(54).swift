//
//  SpiralMatrix(54).swift
//  Leetcode
//
//  Created by Hiroki Minami on 2023-06-23.
//

import Foundation

/// `Spiral Matrix`
/// leetcode link: https://leetcode.com/problems/spiral-matrix/description/
/// O(n^2 * m^2) n: columns, m: rows, checking visited or not everytime takes  another  n * m
/// S(n * m)
func spiralOrder(_ matrix: [[Int]]) -> [Int] {
  let rows = matrix.count
  let columns = matrix[0].count
  
  var visited = [[Bool]](repeating: [Bool](repeating: false, count: columns), count: rows)
  var direction = 0 // 0: right, 1: down, 2: left, 3: up
  
  var output = [Int]()
  var start = (0, 0)
  
  func dfs(_ next: (Int, Int), _ direction: (Int, Int)) -> (Int, Int) {
    visited[next.0][next.1] = true
    output.append(matrix[next.0][next.1])
    let ny = next.0 + direction.0
    let nx = next.1 + direction.1
    if ny >= 0 && ny < matrix.count && nx >= 0 && nx < matrix[0].count && !visited[ny][nx] {
      return dfs((ny, nx), direction)
    }
    return (next.0, next.1)
  }
  
  while visited.flatMap({ $0 }).contains(false) {
    if direction == 0 {
      start = dfs(start, (0, 1))
      start = (start.0 + 1, start.1)
    } else if direction == 1 {
      start = dfs(start, (1, 0))
      start = (start.0, start.1 - 1)
    } else if direction == 2 {
      start = dfs(start, (0, -1))
      start = (start.0 - 1, start.1)
    } else if direction == 3 {
      start = dfs(start, (-1, 0))
      start = (start.0, start.1 + 1)
    }
    direction += 1
    direction %= 4
  }
  return output
}
