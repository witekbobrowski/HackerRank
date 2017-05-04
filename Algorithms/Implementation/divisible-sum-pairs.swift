// https://www.hackerrank.com/challenges/divisible-sum-pairs

import Foundation

let info = readLine()!.components(separatedBy: " ").map { Int($0)! }

let integers = readLine()!.components(separatedBy: " ").map { Int($0)! }

private func findPairs(_ array: [Int], divisor: Int) -> [(Int, Int)] {
    var result: [(Int, Int)] = []

    for index in array.indices {
        for anotherIndex in array.indices {
            if index < anotherIndex, ((array[index] + array[anotherIndex]) % divisor == 0) {
                result.append((index, anotherIndex))
            }
        }
    }
    return result
}

var result = findPairs(integers, divisor: info[1])
print(result.count)
