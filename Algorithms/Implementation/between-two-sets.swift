// https://www.hackerrank.com/challenges/between-two-sets

import Foundation

let numberOfElementsInSets = readLine()!.components(separatedBy: " ").map { Int($0)! } // useless info
let setA = readLine()!.components(separatedBy: " ").map { Int($0)! }
let setB = readLine()!.components(separatedBy: " ").map { Int($0)! }

private func greatestCommonDivisor(_ a: Int, _ b: Int) -> Int {

    var result: (a: Int, b: Int, d: Int) = (a, b, 0)

    while (result.a % 2 == 0) && (result.b % 2 == 0) {
        result = (result.a / 2, result.b / 2, result.d + 1)
    }
    while (result.a != result.b) {
        if (result.a % 2 == 0) { result.a = result.a / 2 }
        else if (result.b % 2 == 0) { result.b = result.b / 2 }
        else if result.a > result.b { result.a = (result.a - result.b) / 2 }
        else { result.b = (result.b - result.a) / 2 }
    }
    return result.a * Int(pow(2.0, Double(result.d)))
}

private func greatestCommonDivisor(_ array: [Int]) -> Int {
    var result: Int = array[0]
    for integer in array {
        result = greatestCommonDivisor(result, integer)
    }
    return result
}

private func leastCommonMultiple(_ a: Int, _ b: Int) -> Int {
    return (a * b)/greatestCommonDivisor(a, b)
}

private func leastCommonMultiple(_ array: [Int]) -> Int {
    var result: Int = array[0]
    for integer in array {
        result = (result * integer)/greatestCommonDivisor(result, integer)
    }
    return result
}

private func betweenNumbers(of first: [Int], and second: [Int]) -> [Int] {
    let LCM = leastCommonMultiple(first)
    let GCD = greatestCommonDivisor(second)
    var result: [Int] = []
    if LCM <= GCD{
        for n in 1...GCD/LCM {
            if GCD % (LCM * n) == 0{
                result.append(LCM * n)
            }
        }
    }
    return result
}

print(betweenNumbers(of: setA.sorted(), and: setB.sorted()).count)
