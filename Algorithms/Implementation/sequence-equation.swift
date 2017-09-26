// https://www.hackerrank.com/challenges/permutation-equation

import Foundation

let n = Int(readLine()!)!
let integers = readLine()!.components(separatedBy: " ").map { Int($0)! }

private func evaluateEquation(_ sequence: [Int], n: Int){
    for x in 1...n {
        for equation in sequence.indices {
            if x == sequence[equation] {
                for anotherEquation in sequence.indices{
                    if equation + 1 == sequence[anotherEquation]{
                        print(anotherEquation + 1)
                    }
                }
            }
        }
    }
}

evaluateEquation(integers, n: n)
