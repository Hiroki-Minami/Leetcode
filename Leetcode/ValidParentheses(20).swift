//
//  ValidParentheses(20).swift
//  Leetcode
//
//  Created by Hiroki Minami on 2023-06-23.
//

import Foundation

/// `Valid Parentheses`
/// leetcode link: https://leetcode.com/problems/valid-parentheses/
/// O(n)
/// S(n) => n + n
func isValid(_ s: String) -> Bool {
  guard s.count % 2 == 0 else {return false}
  var stack: [Character] = []
  for ch in s {
    if ch == "(" || ch == "{" || ch == "[" {
      stack.append(ch)
    } else {
      guard stack.count >= 1 && ((ch == ")" && stack[stack.count-1] == "(") ||
                                 (ch == "}" && stack[stack.count-1] == "{") ||
                                 (ch == "]" && stack[stack.count-1] == "[")) else { return false }
      stack.removeLast()
    }
  }
  return stack.count == 0
}
