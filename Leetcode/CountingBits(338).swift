//
//  CountingBits(338).swift
//  Leetcode
//
//  Created by Hiroki Minami on 2023-07-04.
//

import Foundation

/// `Counting Bits`
/// leetcode link: https://leetcode.com/problems/counting-bits/
/// O(n)
/// S(n)
func countBits(_ n: Int) -> [Int] {
  if n == 0 { return [0] }
  var ans: [Int] = [0]
  
  for i in 1...n {
    var count = i % 2
    count += ans[i/2]
    ans.append(count)
  }
  return ans
}
