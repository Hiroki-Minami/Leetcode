//
//  AddDigits(258).swift
//  Leetcode
//
//  Created by Hiroki Minami on 2023-07-05.
//

import Foundation

/// `Add Digits`
/// leetcode link: https://leetcode.com/problems/add-digits/
/// O(logn^2)
/// S(logn^2)
func addDigits(_ num: Int) -> Int {
  var num = num
  var temp = 0
  while num >= 10 {
    temp = 0
    while num > 0 {
      temp += num % 10
      num = num / 10
    }
    num = temp
  }
  return num
}
