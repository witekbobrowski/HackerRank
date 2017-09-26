// https://www.hackerrank.com/challenges/picking-numbers

import Foundation

let n = Int(readLine()!)!
let numbers = readLine()!.components(separatedBy: " ").map { Int($0)! }


private func pickNumbers(from array: [Int]) -> [Int] {
    var result: [Int] = []
    for index in array.indices {
        var numbers: [Int] = [array[index]]
        for secondIndex in array.indices {
            if index != secondIndex, abs(array[index] - array[secondIndex]) <= 1 {
                var numberFits = true
                for number in numbers {
                    if abs(number - array[secondIndex]) > 1 {
                        numberFits = false
                    }
                }
                if numberFits {
                    numbers.append(array[secondIndex])
                }
            }
        }
        result = numbers.count > result.count ? numbers : result
    }
    return result
}

print(pickNumbers(from: numbers).count)
