// https://www.hackerrank.com/challenges/strange-advertising

import Foundation

let days = Int(readLine()!)!

private func viralAdvertising(_ days: Int) -> Int {
    var result = 0.0
    var target = 5.0
    var sum = 0.0
    for _ in 1...days {
        result = floor(target / 2.0)
        target = result * 3
        sum += result
    }
    return Int(sum)
}

print(viralAdvertising(days))
