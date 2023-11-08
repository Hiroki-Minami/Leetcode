//
//  FindTwoNon-overlappingSub-arraysEachWithTargetSum(1477).swift
//  Leetcode
//
//  Created by Hiroki Minami on 2023-11-05.
//

import Foundation

func minSumOfLengths(_ arr: [Int], _ target: Int) -> Int {
    var sum = 0
    var leftMin = Int.max
    var temp: [Int] = []
    var minimumSubarraysLength = Int.max
    
    func findRight(_ startIndex: Int) -> Int {
        var rightSum = 0
        var rightTemp: [Int] = []
        var rightMin = Int.max
        
        for j in startIndex..<arr.count {
            rightSum += arr[j]
            rightTemp.append(arr[j])
            if rightSum == target {
                rightMin = min(rightMin, rightTemp.count)
            }
            while rightSum > target {
                let num2 = rightTemp.removeFirst()
                rightSum -= num2
                
                if rightSum == target {
                    rightMin = min(rightMin, rightTemp.count)
                }
            }
        }
        return rightMin
    }
    
    for i in 0..<arr.count - 1 {
        sum += arr[i]
        temp.append(arr[i])
        
        if sum == target {
            leftMin = min(leftMin, temp.count)
            let rightTemp = findRight(i + 1)
            if rightTemp != Int.max {
                minimumSubarraysLength = min(minimumSubarraysLength, leftMin + rightTemp)
            }
        }
        while sum > target {
            let num = temp.removeFirst()
            sum -= num
            
            if sum == target {
                leftMin = min(leftMin, temp.count)
                let rightTemp = findRight(i + 1)
                if rightTemp != Int.max {
                    minimumSubarraysLength = min(minimumSubarraysLength, leftMin + rightTemp)
                }
            }
        }
    }
    return minimumSubarraysLength != Int.max ? minimumSubarraysLength: -1
}
