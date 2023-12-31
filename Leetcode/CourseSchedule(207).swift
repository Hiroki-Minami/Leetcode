//
//  CourseSchedule(207).swift
//  Leetcode
//
//  Created by Hiroki Minami on 2023-07-04.
//

import Foundation

/// `Course Schedule`
/// leetcode link: https://leetcode.com/problems/course-schedule/
/// O(n^2)  n + n + n^2
/// S(n) n + n + 2n + n + n
func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
  var indegrees = [Int](repeating: 0, count: numCourses)
  
  for prerequisite in prerequisites {
    indegrees[prerequisite[0]] += 1
  }
  
  var queue = [Int]()
  for (course, indegree) in indegrees.enumerated() {
    if indegree == 0 {
      queue.append(course)
    }
  }
  if queue.count == 0 { return false }
  while !queue.isEmpty {
    let next = queue.removeFirst()
    for prerequisite in prerequisites {
      if prerequisite[1] == next {
        indegrees[prerequisite[0]] -= 1
        if indegrees[prerequisite[0]] == 0 {
          queue.append(prerequisite[0])
        }
      }
    }
  }
  return !indegrees.contains { $0 != 0 }
}
