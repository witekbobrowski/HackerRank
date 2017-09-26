//  https://www.hackerrank.com/challenges/lilys-homework

import Foundation

private func beautiful(_ array: [Int]) -> Int {

    var swaps = 0
    var temp = array
    var sorted = array.sorted()
    var indices: [Int: Int] = [:]

    for (index, element) in array.enumerated() {
        indices[element] = index
    }

    for index in array.indices {
        if temp[index] != sorted[index] {
            swaps += 1
            if let sortedindex = indices[sorted[index]] {
                indices[temp[index]] = sortedindex
                temp[sortedindex] = temp[index]
                temp[index] = sorted[index]
            }
        }
    }

    return swaps
}

let n = readLine()!
let array: [Int] = readLine()!.components(separatedBy: " ").map { Int($0)! }

let result = beautiful(array)
let reversedResult = beautiful(array.reversed())

print(min(result, reversedResult))
