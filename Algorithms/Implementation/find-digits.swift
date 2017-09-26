// https://www.hackerrank.com/challenges/find-digits

import Foundation

let n = Int(readLine()!)!
var testCases: [Int] = []

for _ in 1...n{
    testCases.append(Int(readLine()!)!)
}

private func findDigits(_ number: Int) -> [Int]{
    var digits: [Int] = []
    var temp = number
    while temp > 0 {
        let x = temp % 10
        if x != 0, number % x == 0{
            digits.append(x)
        }
        temp = temp / 10
    }
    return digits
}

for test in testCases {
    print(findDigits(test).count)
}
