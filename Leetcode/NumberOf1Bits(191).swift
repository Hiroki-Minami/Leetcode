//
//  NumberOf1Bits(191).swift
//  Leetcode
//
//  Created by Hiroki Minami on 2023-07-04.
//

import Foundation

/// `Number of 1 Bits`
/// leetcode link: https://leetcode.com/problems/number-of-1-bits/description/
/// O(1) 32
/// S(1) 2
func hammingWeight(_ n: Int) -> Int {
  var answer = 0
  var digit = 1
  
  for _ in 0..<32 {
    if (n & digit) == digit {
      answer += 1
    }
    digit = digit << 1
  }
  
  return answer
}
