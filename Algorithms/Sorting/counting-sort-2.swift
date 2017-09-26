//  https://www.hackerrank.com/challenges/countingsort2

import Foundation

private func countingSort(elementsIn array: [Int]) -> [Int] {

    var occurances: [Int:Int] = [:]

    for element in array {
        if occurances[element] != nil {
            occurances[element]! += 1
        } else {
            occurances[element] = 1
        }
    }

    var result: [Int] = []

    for number in 0...99 {
        if let count = occurances[number] {
            for _ in 1...count {
                result.append(number)
            }
        }
    }

    return result
}

let n = readLine()!
countingSort(elementsIn: readLine()!.components(separatedBy: " ").map() {Int($0)!}).forEach() {print($0, terminator: " ")}
