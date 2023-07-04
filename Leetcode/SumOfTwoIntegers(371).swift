//
//  SumOfTwoIntegers(371).swift
//  Leetcode
//
//  Created by Hiroki Minami on 2023-07-04.
//

import Foundation

/// `Sum of Two Integers`
/// leetcode link: https://leetcode.com/problems/sum-of-two-integers/description/
/// O(n) the number of digits
/// S(n)
func getSum(_ a: Int, _ b: Int) -> Int {
  var answer = a
  var carry = b
  
  while carry != 0 {
    let temp = answer & carry
    answer = answer ^ carry
    
    carry = temp << 1
  }
  return answer
}
