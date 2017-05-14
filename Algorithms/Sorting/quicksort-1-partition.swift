// https://www.hackerrank.com/challenges/quicksort1

import Foundation

private func partition(_ array: inout [Int], start startIndex: Int, end endIndex: Int) -> Int {
    let pivot = array[startIndex]
    var i = startIndex - 1
    var j = endIndex + 1
    var temp = 0
    while true {
        repeat {
            i += 1
        } while array[i] < pivot
        repeat {
            j -= 1
        } while array[j] > pivot
        if i >= j {
            return j
        }
        temp = array[i]
        array[i] = array[j]
        array[j] = temp
    }
}

private func quickSort(_ array: inout [Int], start startIndex: Int, end endIndex: Int) {
    if startIndex < endIndex {
        let p = partition(&array, start: startIndex, end: endIndex)
        quickSort(&array, start: startIndex, end: p)
        quickSort(&array, start: p + 1, end: endIndex)
    }
}

let n = readLine()!
var unsorted: [Int] = readLine()!.components(separatedBy: " ").map { Int($0)! }

quickSort(&unsorted, start: 0, end: unsorted.count - 1)

var result = ""
for item in unsorted {
    result.append("\(item) ")
}

print(result)
