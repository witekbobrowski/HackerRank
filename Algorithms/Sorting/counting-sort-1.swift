//  https://www.hackerrank.com/challenges/countingsort1

import Foundation

private func count(elementsIn array: [Int]) -> [Int] {

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
            result.append(count)
        } else {
            result.append(0)
        }
    }

    return result
}

let n = readLine()!
count(elementsIn: readLine()!.components(separatedBy: " ").map() {Int($0)!}).forEach() {print($0, terminator: " ")}
