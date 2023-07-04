//
//  BuddyStrings(859).swift
//  Leetcode
//
//  Created by Hiroki Minami on 2023-07-03.
//

import Foundation

/// `Buddy Strings`
/// leetcode link: https://leetcode.com/problems/buddy-strings/description/
/// O(n) n + n + n = 3n
/// S(n) n + 2n + 2n + 1 = 5n + 1
func buddyStrings(_ s: String, _ goal: String) -> Bool {
  var charsMap: [Character: Int] = [:]
  
  for ch in s {
    charsMap[ch, default: 0] += 1
  }
  if s == goal {
    if charsMap.values.contains(where: {$0 > 1}) { return true }
    else { return false }
  }
  
  var stack = [Character]()
  var isSwaped = false
  
  for i in 0..<s.count {
    let sIndex = s.index(s.startIndex, offsetBy: i)
    let goalIndex = goal.index(goal.startIndex, offsetBy: i)
    
    let sCh = s[sIndex]
    let goalCh = goal[goalIndex]
    
    if sCh != goalCh {
      if (!stack.isEmpty && stack[0] != sCh) || isSwaped {
        return false
      } else if !stack.isEmpty && stack[0] == sCh {
        stack.removeFirst()
        isSwaped = true
      } else {
        stack.append(goalCh)
      }
    }
  }
  return stack.isEmpty
}
