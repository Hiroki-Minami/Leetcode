//
//  EvaluateDivision(399).swift
//  Leetcode
//
//  Created by Hiroki Minami on 2023-07-05.
//

import Foundation

/// `Evaluate Division`
/// leetcode link: https://leetcode.com/problems/evaluate-division/
/// O(n^3)
/// S(n^2)
func calcEquation(_ equations: [[String]], _ values: [Double], _ queries: [[String]]) -> [Double] {
  // relaxation with adjacent matrix
  let n = equations.flatMap({ $0 }).count
  
  var adjMatrix = [[Double]](repeating: [Double](repeating: -1.0, count: n), count: n)
  var nodeIndexMap: [String: Int] = [:]
  var nodes = Set<String>()
  var index = 0
  
  for (j, equation) in equations.enumerated() {
    if !nodes.contains(equation[0]) {
      nodeIndexMap[equation[0]] = index
      index += 1
      nodes.insert(equation[0])
    }
    
    if !nodes.contains(equation[1]) {
      nodeIndexMap[equation[1]] = index
      index += 1
      nodes.insert(equation[1])
    }
    
    let from = nodeIndexMap[equation[0]]!
    let to = nodeIndexMap[equation[1]]!
    adjMatrix[from][to] = values[j]
    adjMatrix[to][from] = 1.0 / values[j]
  }
  
  // Floyd-Warshall
  for k in 0..<n {
    for i in 0..<n {
      for j in 0..<n {
        guard i != j else {
          adjMatrix[i][j] = 1.0
          continue
        }
        if adjMatrix[i][j] == -1 && adjMatrix[i][k] != -1 && adjMatrix[k][j] != -1 {
          adjMatrix[i][j] = adjMatrix[i][k] * adjMatrix[k][j]
        }
      }
    }
  }
  
  var ret = [Double]()
  for querie in queries {
    guard let from = nodeIndexMap[querie[0]], let to = nodeIndexMap[querie[1]] else {
      ret.append(-1.0)
      continue
    }
    ret.append(adjMatrix[from][to])
  }
  return ret
}
