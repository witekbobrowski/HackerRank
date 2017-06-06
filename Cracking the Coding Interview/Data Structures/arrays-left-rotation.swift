//  https://www.hackerrank.com/challenges/ctci-array-left-rotation

import Foundation

private func leftShift(array: [Int], times: Int) -> [Int] {
    var result: [Int] = []
    for index in array.indices {
        result.append(array[(index + times) % array.count ])
    }
    return result
}

let info = readLine()!.components(separatedBy: " ").map { Int($0)! }

leftShift(array: readLine()!.components(separatedBy: " ").map { Int($0)! }, times: info[1]).forEach( { print("\($0)", terminator: " ") } )
