//
//  ReverseBits(190).swift
//  Leetcode
//
//  Created by Hiroki Minami on 2023-07-04.
//

import Foundation

/// `Reverse Bits`
/// leetcode link: https://leetcode.com/problems/reverse-bits/description/
/// O(1) 32
/// S(1) 32 + 2
func reverseBits(_ n: Int) -> Int {
  var digit = 1 << 31
  var answer = 0
  
  for i in 0..<32 {
    var bit = n & digit
    bit = bit >> (31 - i * 2)
    answer = answer | bit
    digit = digit >> 1
  }
  return answer
}
