// https://www.hackerrank.com/challenges/save-the-prisoner

import Foundation

let n = Int(readLine()!)!
var testCases: [[Int]] = []

for _ in 1...n {
    testCases.append(readLine()!.components(separatedBy: " ").map { Int($0)!})
}

private func poisonedPrisoner(from jail: [Int]) -> Int {
    return (jail[1] + jail[2] - 1) % jail[0] == 0 ? jail[0] : (jail[1] + jail[2] - 1) % jail[0]
}

for test in testCases {
    print(poisonedPrisoner(from: test))
}
