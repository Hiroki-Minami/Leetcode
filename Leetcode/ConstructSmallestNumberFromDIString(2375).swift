//
//  ConstructSmallestNumberFromDIString(2375).swift
//  Leetcode
//
//  Created by Hiroki Minami on 2023-07-23.
//

import Foundation

/// `Construct Smallest Number From DI String`
/// leetcode link: https://leetcode.com/problems/construct-smallest-number-from-di-string/description/
/// O(n^2)
/// S(n^2)
func smallestNumber(_ pattern: String) -> String {
  let n = pattern.count
  let start = pattern.startIndex
  
  var appeared = Set<Int>()
  var candidate = [Int]()
  
  func smallestNumberHelper(_ index: Int) -> String? {
    if index == n {
      return String(candidate.reversed().enumerated().reduce(0) { $0 + $1.element * power(base: 10, exponent: $1.offset) })
    }
    
    let pIndex = pattern.index(start, offsetBy: index)
    let instruction = pattern[pIndex]
    let smallest = instruction == "I" && !candidate.isEmpty ? min(9, candidate.last! + 1): 1
    let largest = instruction == "D" && !candidate.isEmpty ? max(1, candidate.last! - 1): 9
    
    for i in smallest...largest {
      if !appeared.contains(i) {
        appeared.insert(i)
        candidate.append(i)
        if let ret = smallestNumberHelper(index + 1) { return ret }
        appeared.remove(i)
        candidate.removeLast()
      }
    }
    return nil
  }
  
  func power(base: Int, exponent: Int) -> Int {
    let ret = pow(Double(base), Double(exponent))
    return Int(ret)
  }
  
  let first = pattern[start] == "I" ? 1: 2
  for j in first...9 {
    appeared.insert(j)
    candidate.append(j)
    if let ret = smallestNumberHelper(0) { return ret }
    appeared.remove(j)
    candidate.removeLast()
  }
  return ""
}
