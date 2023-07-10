//
//  NumberOfIslands(200).swift
//  Leetcode
//
//  Created by Hiroki Minami on 2023-07-09.
//

import Foundation

/// `Number of Islands`
/// leetcode link: https://leetcode.com/problems/number-of-islands/description/
/// O(n) n
/// S(n)
func numIslands(_ grid: [[Character]]) -> Int {
    let n = grid.count
    let m = grid[0].count

    var islands = 0
    var visited = Set<String>()
    let adj = [
        (0, 1),
        (0, -1),
        (1, 0),
        (-1, 0)
    ]

    func traverse(_ curr: (Int, Int)) {
        let key = "\(curr.0),\(curr.1)"
        visited.insert(key)
        for (dy, dx) in adj {
            let ny = dy + curr.0
            let nx = dx + curr.1
            let nKey = "\(ny),\(nx)"
            if ny >= 0 && ny < n && nx >= 0 && nx < m && !visited.contains(nKey) && grid[ny][nx] == "1" {
                traverse((ny, nx))
            }
        }
    }

    for (i, row) in grid.enumerated() {
        for (j, cell) in row.enumerated() {
            let start = "\(i),\(j)"
            if cell == "1" && !visited.contains(start) {
                traverse((i, j))
                islands += 1
            }
        }
    }
    return islands
}
