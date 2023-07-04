//
//  SimplifyPath(71).swift
//  Leetcode
//
//  Created by Hiroki Minami on 2023-07-04.
//

import Foundation

/// `Simplify Path`
/// leetcode link: https://leetcode.com/problems/simplify-path/description/
/// O(n) if firstIndex or lastIndex take n steps at most it's going to be O(n^2)
/// S(n) n + 1
func simplifyPath(_ path: String) -> String {
  let strs = path.split(separator: "/")
  var canonical = "/"
  for str in strs {
    if str == "." {
      // nothing to do
    } else if str == ".." {
      if canonical.lastIndex(of: "/")! != canonical.firstIndex(of: "/")! {
        canonical = String(canonical[..<canonical.lastIndex(of: "/")!])
      } else if canonical.count > 1 {
        canonical = "/"
      }
    } else {
      canonical += canonical != "/" ? "/" + str : str
    }
  }
  return canonical
}
