//
//  BestTimetoBuyandSellStock(121).swift
//  Leetcode
//
//  Created by Hiroki Minami on 2023-06-23.
//

import Foundation

/// `Best Time to Buy and Sell Stock`
/// leetcode link: https://leetcode.com/problems/best-time-to-buy-and-sell-stock/description/
/// O(n)
/// S(n)
func maxProfit(_ prices: [Int]) -> Int {
  var maxProf = 0
  var tempMin = 0
  guard prices.count > 1 else { return 0 }
  
  tempMin = prices[0]
  
  for i in 1..<prices.count {
    if tempMin > prices[i] {
      tempMin = prices[i]
      continue
    }
    maxProf = max(maxProf, prices[i] - tempMin)
  }
  return maxProf
}
