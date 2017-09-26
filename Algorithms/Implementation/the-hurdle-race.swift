// https://www.hackerrank.com/challenges/the-hurdle-race

import Foundation;

let info = readLine()!.components(separatedBy: " ").map { Int($0)! }
let hurdles = readLine()!.components(separatedBy: " ").map { Int($0)! }

private func countMagicPotions(_ heights: [Int], max: Int) -> Int {
    var currentMax = max
    var potions = 0 { willSet{ currentMax = max + newValue }}
    for hurdle in heights {
        potions += hurdle - currentMax >= 0 ? hurdle - currentMax : 0
    }
    return potions
}

print(countMagicPotions(hurdles, max: info[1]))
