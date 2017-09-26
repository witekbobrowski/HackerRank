//  https://www.hackerrank.com/challenges/quicksort3

import Foundation

private func partition(_ array: inout [Int], start startIndex: Int, end endIndex: Int) -> Int {

    let pivot = array[endIndex]
    var smaller = startIndex - 1
    for index in startIndex..<endIndex {
        if array[index] <= pivot{
            smaller += 1
            if smaller != index {
                swap(&array[index], &array[smaller])
            }
        }
    }

    if endIndex != smaller + 1 {
        swap(&array[endIndex], &array[smaller + 1])
    }

    array.forEach() {print($0, terminator: " ")}
    print("")

    return smaller + 1
}

private func quickSort(_ array: inout [Int], start startIndex: Int, end endIndex: Int) {
    if startIndex < endIndex {
        let p = partition(&array, start: startIndex, end: endIndex)
        quickSort(&array, start: startIndex, end: p - 1)
        quickSort(&array, start: p + 1, end: endIndex)
    }
}

let n = readLine()!
var unsorted: [Int] = readLine()!.components(separatedBy: " ").map { Int($0)! }

quickSort(&unsorted, start: 0, end: unsorted.count - 1)
