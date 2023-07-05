//
//  CoinChange(322).swift
//  Leetcode
//
//  Created by Hiroki Minami on 2023-07-05.
//

import Foundation

/// `Coin Change`
/// leetcode link: https://leetcode.com/problems/coin-change/description/
/// O(n)  m * n  n: the number of coins, m: amount
/// S(n) 
func coinChange(_ coins: [Int], _ amount: Int) -> Int {
  guard amount > 0 else { return 0 }
  var dp = [Int](repeating: Int.max, count: amount + 1)
  dp[0] = 0
  
  for i in 1...amount {
    for coin in coins {
      if i - coin >= 0 && dp[i-coin] != Int.max {
        dp[i] = min(dp[i], dp[i-coin] + 1)
      }
    }
  }
  return dp[amount] != Int.max ? dp[amount]: -1
}
