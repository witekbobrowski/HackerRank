// https://www.hackerrank.com/challenges/climbing-the-leaderboard

import Foundation

let n = Int(readLine()!)!
let scores = readLine()!.components(separatedBy: " ").map { Int($0)! }
let m = Int(readLine()!)!
let alice = readLine()!.components(separatedBy: " ").map { Int($0)! }

private func printAlicesRanks(from scores: [Int], _ points: [Int]) {

    var ranking: [Int] = []

    for score in scores{
        if ranking.isEmpty {
            ranking.append(score)
        } else if ranking[ranking.endIndex - 1] > score{
            ranking.append(score)
        }
    }

    for item in points{
        while !ranking.isEmpty && ranking[ranking.count - 1] <= item {
            ranking.removeLast()
        }
        print(ranking.count + 1)
    }
}

printAlicesRanks(from: scores, alice)
