//
//  TopKFrequentElements(347).swift
//  Leetcode
//
//  Created by Hiroki Minami on 2023-07-04.
//

import Foundation

/// `Top K Frequent Elements`
/// leetcode link: https://leetcode.com/problems/top-k-frequent-elements/
/// O(n^2) n + logn + n^2
/// S(n) 4n
func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
  var numsMap: [Int: Int] = [:]
  for num in nums {
    numsMap[num, default: 0] += 1
  }
  
  let values = numsMap.values.sorted(by: >)
  var ret = [Int]()
  for i in 0..<k {
    if let num = numsMap.first(where: { $0.value == values[i] })?.key {
      ret.append(num)
      numsMap[num] = nil
    }
  }
  
  return ret
}
