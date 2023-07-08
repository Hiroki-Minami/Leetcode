//
//  RotateImage(48).swift
//  Leetcode
//
//  Created by Hiroki Minami on 2023-07-06.
//

import Foundation

/// `Rotate Image`
/// leetcode link: https://leetcode.com/problems/rotate-image/description/
/// O(n^2) matrix = n * n
/// S(n^2)
func rotate(_ matrix: inout [[Int]]) {
  let n = matrix.count
  let move = matrix.count - 1
  
  var cycle = 0
  for i in stride(from: move, to: 0, by: -2) {
    for j in 0..<i {
      var x = j + cycle
      var y = cycle
      var temp = matrix[y][x]
      for k in 0..<4 {
        for _ in 0..<i {
          switch k {
          case 0:
            if x < n - 1 - cycle { x += 1 }
            else { y += 1 }
          case 1:
            if y < n - 1 - cycle { y += 1 }
            else { x -= 1 }
          case 2:
            if x > 0 + cycle { x -= 1 }
            else { y -= 1 }
          case 3:
            if y > 0 + cycle { y -= 1 }
            else { x += 1 }
          default:
            print("unexpected")
          }
        }
        let temp2 = matrix[y][x]
        matrix[y][x] = temp
        temp = temp2
      }
    }
    cycle += 1
  }
}
