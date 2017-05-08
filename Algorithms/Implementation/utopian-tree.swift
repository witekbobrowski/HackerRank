// https://www.hackerrank.com/challenges/utopian-tree

import Foundation


let n = Int(readLine()!)!
var testCases: [Int] = []

for _ in 1...n {
    testCases.append(Int(readLine()!)!)
}

private func howTallTheTreeWillBe(after cycles: [Int]) -> [Int] {

    var results: [Int] = []

    for cycle in cycles {
        var height = 1
        var currentCycle = 0
        while currentCycle < cycle {
            currentCycle += 1
            switch currentCycle % 2 {
            case 1:
                height = height * 2
            default:
                height += 1
            }
        }
        results.append(height)
    }
    return results
}

let results = howTallTheTreeWillBe(after: testCases)

for result in results {
    print(result)
}
