//
//  AddTwoNumbersII(445).swift
//  Leetcode
//
//  Created by Hiroki Minami on 2023-07-17.
//

import Foundation

/// `Add Two Numbers II`
/// leetcode link: https://leetcode.com/problems/add-two-numbers-ii/description/
/// O(n) n + n + n + n + n
/// S(n) n + n + n
func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    var l1List: [ListNode?] = []
    var l2List: [ListNode?] = []

    var curr: ListNode? = l1
    while let node = curr {
        l1List.append(curr)
        curr = node.next
    }

    curr = l2
    while let node = curr {
        l2List.append(curr)
        curr = node.next
    }

    l1List.reverse()
    l2List.reverse()

    var larger = l1List.count >= l2List.count ? l1List: l2List
    var smaller = l1List.count < l2List.count ? l1List: l2List

    var next: ListNode? = nil
    let n = larger.count
    var carry = 0
    for i in 0..<n {
        var sum = 0
        if i < smaller.count {
            sum += smaller[i]!.val
        }
        sum += larger[i]!.val
        sum += carry

        carry = sum / 10
        sum %= 10
        larger[i]!.val = sum
        larger[i]!.next = next
        next = larger[i]
    }
    if carry == 0 {
        return larger[n-1]
    } else {
        smaller[0]!.val = carry
        smaller[0]!.next = larger[n-1]
        return smaller[0]
    }
}
