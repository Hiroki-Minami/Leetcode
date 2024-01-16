//
//  RankTeamsByVotes(1366).swift
//  Leetcode
//
//  Created by Hiroki Minami on 2023-11-19.
//

import Foundation

func rankTeams(_ votes: [String]) -> String {
    var map: [Character: [Int]] = [:]
    let initArr = [Int](repeating: 0, count: votes[0].count)
    for ch in votes[0] {
        map[ch] = initArr
    }
    
    for vote in votes {
        for (rank, ch) in vote.enumerated() {
            map[ch]![rank] = map[ch]![rank] + 1
        }
    }
    
    var set: Set<Character> = Set()
    var used: Set<Character> = Set()
    
    func helper(_ rank: Int) -> [Character] {
        let i = map.values.map({ $0[rank] }).max()!
        var mostPopular: [Character]
        if set.isEmpty {
            mostPopular = map.filter({ !used.contains($0.key) && $0.value[rank] == i }).map({return $0.key})
        } else {
            mostPopular = map.filter({ !used.contains($0.key) && set.contains($0.key) && $0.value[rank] == i }).map({return $0.key})
        }
        if mostPopular.count == 1 {
            return [mostPopular[0]]
        } else if rank == votes[0].count - 1 {
            return mostPopular.sorted()
        }
        set.removeAll()
        for ch in mostPopular {
            set.insert(ch)
        }
        return helper(rank + 1)
    }
    
    var ret = ""
    var iter = 0
    while iter < votes[0].count {
        let chs = helper(0)
        ret.append(contentsOf: chs)
        for ch in chs {
            map[ch] = nil
            used.insert(ch)
        }
        set.removeAll()
        iter += chs.count
    }
    return ret
}
