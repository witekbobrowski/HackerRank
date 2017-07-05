// https://www.hackerrank.com/challenges/quicksort2

import Foundation

private func quickSort(_ array: inout [Int], start startIndex: Int, end endIndex: Int) {
    if startIndex < endIndex {
        var pivot: (value: Int?, index: Int?) = (value: array[startIndex],index: nil)
        var left: [Int] = []
        var right: [Int] = []

        for index in startIndex + 1...endIndex {
            if array[index] < pivot.value! {
                left.append(array[index])
            } else {
                right.append(array[index])
            }
        }

        for index in startIndex...endIndex {
            if !left.isEmpty {
                array[index] = left.removeFirst()
            } else if pivot.value != nil {
                array[index] = pivot.value!
                pivot = (value: nil, index: index)
            } else {
                array[index] = right.removeFirst()
            }

        }

        quickSort(&array, start: startIndex, end: pivot.index! - 1)
        quickSort(&array, start: pivot.index! + 1, end: endIndex)
        for index in startIndex...endIndex {
            print(array[index], terminator: " ")
        }
        print("")
    }
}

let n = readLine()!
var unsorted: [Int] = readLine()!.components(separatedBy: " ").map { Int($0)! }

quickSort(&unsorted, start: 0, end: unsorted.count - 1)
