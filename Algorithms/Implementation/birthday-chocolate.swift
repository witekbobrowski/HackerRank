// https://www.hackerrank.com/challenges/the-birthday-bar

import Foundation

let squares = readLine()! // useless info
let integers = readLine()!.components(separatedBy: " ").map { Int($0)! }
let birthday = readLine()!.components(separatedBy: " ").map { Int($0)! }

private func waysToBreakTheChocolate(_ bar: [Int], lenght: Int, sum: Int) -> Int {
    var result: Int = 0
    for index in bar.indices {
        var summary: Int = bar[index]
        for value in 1..<lenght{
            if (index + value) < bar.indices.endIndex {
                summary += bar[index + value]
            } else {
                summary = 0
            }
        }
        if summary == sum { result += 1 }
    }
    return result
}

print(waysToBreakTheChocolate(integers, lenght: birthday[1], sum: birthday[0]))
