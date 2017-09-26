// https://www.hackerrank.com/challenges/angry-professor

import Foundation

let T = Int(readLine()!)!

var testCases: [[[Int]]] = []

for n in 1...T {
    var testCase: [[Int]] = []
    testCase.append(readLine()!.components(separatedBy: " ").map{ Int($0)! })
    testCase.append(readLine()!.components(separatedBy: " ").map{ Int($0)! })
    testCases.append(testCase)
}

private func willTheClassBeCancelled(test cases: [[[Int]]]){
    for test in cases{
        var studentsOnTime = 0
        for student in test[1] {
            if student <= 0 { studentsOnTime += 1}
        }
        print(studentsOnTime < test[0][1] ? "YES" : "NO")
    }
}

willTheClassBeCancelled(test: testCases)
