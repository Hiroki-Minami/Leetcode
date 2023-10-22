//
//  KokoEatingBananas(875).swift
//  Leetcode
//
//  Created by Hiroki Minami on 2023-10-01.
//

import Foundation

func minEatingSpeed(_ piles: [Int], _ h: Int) -> Int {
    let sum = piles.reduce(0, +)
    var k = sum % h == 0 ? sum / h: sum / h + 1
    
    while true {
        var takes = 0
        for pile in piles {
            takes += pile % k == 0 ? pile / k: pile / k + 1
        }
        if takes <= h { break }
        k += 1
    }
    return k
}
