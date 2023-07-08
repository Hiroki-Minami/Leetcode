//
//  WordSearch(79).swift
//  Leetcode
//
//  Created by Hiroki Minami on 2023-07-07.
//

import Foundation

/// `Word Search`
/// leetcode link: https://leetcode.com/problems/word-search/description/
/// O(m * n^2) m + n + m + n^n * m n: the size of board; m: the length of word
/// S(n^2)
func exist(_ board: [[Character]], _ word: String) -> Bool {
  let n = board.count
  let m = board[0].count
  
  var chars: [Character] = []
  var charsMap: [Character: Int] = [:]
  for ch in word {
    chars.append(ch)
    charsMap[ch, default: 0] += 1
  }
  
  var boardMap: [Character: Int] = [:]
  for ch in board.flatMap({$0}) {
    boardMap[ch, default: 0] += 1
  }
  
  for (key, value) in charsMap {
    guard let boardVal = boardMap[key], boardVal >= value else { return false }
  }
  
  var visited = Set<String>()
  
  let adj = [
    (0, 1),
    (0, -1),
    (1, 0),
    (-1, 0)
  ]
  
  func traverse(_ cur: (Int, Int), _ index: Int) -> Bool {
    if index == chars.count - 1 { return true }
    let key = "\(cur.0),\(cur.1)"
    visited.insert(key)
    
    for (dy, dx) in adj {
      let ny = cur.0 + dy
      let nx = cur.1 + dx
      let nextKey = "\(ny),\(nx)"
      if ny >= 0 && ny < n && nx >= 0 && nx < m && !visited.contains(nextKey) && chars[index + 1] == board[ny][nx] && traverse((ny, nx), index + 1) {
        return true
      }
    }
    visited.remove(key)
    return false
  }
  
  for (i, row) in board.enumerated() {
    for (j, cell) in row.enumerated() {
      if cell == chars[0] && traverse((i, j), 0) { return true }
      visited.removeAll()
    }
  }
  return false
}
