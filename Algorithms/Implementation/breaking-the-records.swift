// https://www.hackerrank.com/challenges/breaking-best-and-worst-records

import Foundation

let games = readLine()! // useless info

let scores = readLine()!.components(separatedBy: " ").map { Int($0)! }

private func evaluateRecords(_ scores: [Int]) -> (highest: Int, lowest: Int) {

    var highScoreObserver: Int = 0
    var lowScoreObserver: Int = 0

    var highScore: Int = scores[0] {
        didSet {
            highScoreObserver += 1
        }
    }
    var lowScore: Int = scores[0] {
        didSet {
            lowScoreObserver += 1
        }
    }

    for score in scores {
        if highScore < score {
            highScore = score
        }
        if lowScore > score {
            lowScore = score
        }
    }
    return (highScoreObserver, lowScoreObserver)
}

let result = evaluateRecords(scores)
print("\(result.highest) \(result.lowest)")
