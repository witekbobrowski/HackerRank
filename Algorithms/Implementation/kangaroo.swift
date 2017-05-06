// https://www.hackerrank.com/challenges/kangaroo

import Foundation

let data = readLine()!.components(separatedBy: " ").map { Int($0)! }

var firstKangaroo: (position: Int, speed: Int) = (data[0], data[1])
var secondKangaroo: (position: Int, speed: Int) = (data[2], data[3])

private func kangarooRaceSimulator(first: inout (position: Int, speed: Int), second: inout (position: Int, speed: Int)) -> String {
    var kangaroosWillMeet: Bool = false

    var kangarooIsAbleToCatchUp: Bool {
        if first.position > second.position && first.speed >= second.speed {
            return false
        } else if first.position < second.position && first.speed <= second.speed {
            return false
        } else { return true }
    }

    while kangarooIsAbleToCatchUp {
        kangaroosWillMeet = first.position == second.position ? true : false
        first.position = first.position + first.speed
        second.position = second.position + second.speed
    }

    return kangaroosWillMeet ? "YES" : "NO"
}

print(kangarooRaceSimulator(first: &firstKangaroo, second: &secondKangaroo))
