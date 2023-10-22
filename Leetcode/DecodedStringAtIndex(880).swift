//
//  DecodedStringAtIndex(880).swift
//  Leetcode
//
//  Created by Hiroki Minami on 2023-09-27.
//

import Foundation

/// `Decoded String at Index`
/// leetcode link: https://leetcode.com/problems/decoded-string-at-index/
/// O(2^n)
/// S(2^n)
func decodeAtIndex(_ s: String, _ k: Int) -> String {
    let chars: [Character] = Array(s)
    var ret: [Character] = []
    for char in chars {
        if char.isNumber {
            let element = ret
            for _ in 1..<Int(String(char))! {
                ret.append(contentsOf: element)
            }
        } else {
            ret.append(char)
        }
        if ret.count > k { break }
    }
    return String(ret[k - 1])
}
