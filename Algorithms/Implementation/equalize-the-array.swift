// https://www.hackerrank.com/challenges/equality-in-a-array

import Foundation

private func costOfEquality(of array: [Int]) -> Int {

    var cost = 0
    var numbers: [Int:Int] = [:]
    var mostPopularItem = (0, 0)

    for item in array {
        if let number = numbers[item]{
            numbers[item] = number + 1
        } else {
            numbers[item] = 1
        }
    }

    for key in numbers.keys {
        mostPopularItem = mostPopularItem.1 < numbers[key]! ? (key, numbers[key]!) : mostPopularItem
    }

    for key in numbers.keys {
        cost += mostPopularItem.0 != key ? numbers[key]! : 0
    }

    return cost
}

let n = readLine()!
print(costOfEquality(of: readLine()!.components(separatedBy: " ").map { Int($0)! }))
