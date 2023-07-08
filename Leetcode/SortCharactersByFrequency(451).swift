//
//  SortCharactersByFrequency(451).swift
//  Leetcode
//
//  Created by Hiroki Minami on 2023-07-05.
//

import Foundation

/// `Sort Characters By Frequency`
/// leetcode link: https://leetcode.com/problems/sort-characters-by-frequency/description/
/// O(n^2) n + logn + n * (n + n)
/// S(n)
func frequencySort(_ s: String) -> String {
    var dict: [Character: Int] = [:]

    for ch in s {
        dict[ch, default: 0] += 1
    }

    var nums = Array(Set<Int>(Array(dict.values)))
    nums.sort(by: >)
    var answer = ""

    for num in nums {
        let chs = dict.filter({ $0.value == num }).map({ $0.key })
        for ch in chs {
          answer.append(String([Character](repeating: ch, count: num)))
        }
    }
    return answer
}
