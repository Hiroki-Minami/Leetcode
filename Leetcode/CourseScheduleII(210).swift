//
//  CourseScheduleII(210).swift
//  Leetcode
//
//  Created by Hiroki Minami on 2023-07-05.
//

import Foundation

/// `Course Schedule II`
/// leetcode link: https://leetcode.com/problems/course-schedule-ii/
/// O(n^2)  n + n + n^2 + n
/// S(n)
func findOrder(_ numCourses: Int, _ prerequisites: [[Int]]) -> [Int] {
  var indegrees = [Int](repeating: 0, count: numCourses)
  var output = [Int]()
  
  for prerequisite in prerequisites {
    indegrees[prerequisite[0]] += 1
  }
  
  var queue = [Int]()
  for (course, indegree) in indegrees.enumerated() {
    if indegree == 0 {
      queue.append(course)
    }
  }
  if queue.count == 0 { return output }
  while !queue.isEmpty {
    let next = queue.removeFirst()
    output.append(next)
    for prerequisite in prerequisites {
      if prerequisite[1] == next {
        indegrees[prerequisite[0]] -= 1
        if indegrees[prerequisite[0]] == 0 {
          queue.append(prerequisite[0])
        }
      }
    }
  }
  if indegrees.contains(where: { $0 != 0 }) {
    return []
  } else {
    return output
  }
}
