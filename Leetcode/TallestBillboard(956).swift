//
//  TallestBillboard.swift
//  Leetcode
//
//  Created by Hiroki Minami on 2023-10-29.
//

import Foundation

/// `Tallest Billboard`
/// leetcode link: https://leetcode.com/problems/tallest-billboard/description/
/// O(n^4)
func tallestBillboard(_ rods: [Int]) -> Int {
    var maxRodLength = 0
    
    func tallestBillboardHelper(_ index: Int, _ sum: Int, _ arr: [Int]) {
        if index == rods.count { return }
        
        // not take
        tallestBillboardHelper(index + 1, sum, arr)
        
        // take
        var sum = sum + rods[index]
        var arr = arr
        arr.append(rods[index])
        if sum % 2 == 0 && arr.count >= 2 && sum / 2 > maxRodLength && canMakeSameSizeRod(sum / 2, arr) {
            maxRodLength = sum / 2
            
        }
        tallestBillboardHelper(index + 1, sum, arr)
    }
    
    func canMakeSameSizeRod(_ halfSum: Int, _ arr: [Int]) -> Bool {
        func canMakeSameSizeRodHelper(_ index: Int, _ sum: Int) -> Bool {
            if sum == halfSum { return true }
            if sum > halfSum { return false }
            if index == arr.count { return false }
            
            // not take
            let notTaken = canMakeSameSizeRodHelper(index + 1, sum)
            if notTaken { return true }
            let taken = canMakeSameSizeRodHelper(index + 1, sum + arr[index])
            
            return notTaken || taken
        }
        return canMakeSameSizeRodHelper(0, 0)
    }
    tallestBillboardHelper(0, 0, [])
    return maxRodLength
}
