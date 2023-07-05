//
//  WordBreak(139).swift
//  Leetcode
//
//  Created by Hiroki Minami on 2023-07-05.
//

import Foundation

/// `Word Break`
/// leetcode link: https://leetcode.com/problems/word-break/description/
/// O(n^2) 
/// S(n) 4n + 3m
func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
  let end = s.endIndex
  let start = s.startIndex
  let wordSet = Set(wordDict)
  var memo: [Int: Bool] = [:]
  
  func wordBreakHelper(_ startIndex: Int, _ index: Int) -> Bool {
    if let ret = memo[startIndex] { return ret }
    let sStartIndex = s.index(start, offsetBy: startIndex)
    let sIndex = s.index(start, offsetBy: index)
    if sIndex >= end {
      if startIndex == index {
        return true
      } else {
        return false
      }
    }
    
    let subS = s[sStartIndex...sIndex]
    for word in wordSet {
      if subS == word {
        if wordBreakHelper(index + 1, index + 1) { return true }
        else { memo[index + 1] = false }
      }
    }
    return wordBreakHelper(startIndex, index + 1)
  }
  
  return wordBreakHelper(0, 0)
}
