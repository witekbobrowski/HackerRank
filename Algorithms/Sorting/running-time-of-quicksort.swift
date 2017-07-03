//  https://www.hackerrank.com/challenges/quicksort4

import Foundation

var result = 0

private func insertionSort(_ array: [Int]) -> [Int] {

    var temp = array
    for index in temp.indices {
        if index == 0 { continue }
        if temp[index] < temp[index - 1] {
            swap(&temp[index], &temp[index - 1])
            result += 1
            var i = index
            while true {
                if i == 1 { break }
                if temp[i - 1] < temp[i - 2] {
                    swap(&temp[i - 1], &temp[i - 2])
                    result += 1
                } else {
                    break
                }
                i -= 1
            }
        }
    }
    return temp
}

private func partition(_ array: inout [Int], start startIndex: Int, end endIndex: Int) -> Int {

    let pivot = array[endIndex]
    var smaller = startIndex - 1
    for index in startIndex..<endIndex {
        if array[index] <= pivot{
            smaller += 1
            result -= 1
            if smaller != index {
                swap(&array[index], &array[smaller])
            }
        }
    }

    if endIndex != smaller + 1 {
        swap(&array[endIndex], &array[smaller + 1])
    }
    result -= 1

    return smaller + 1
}

private func quickSort(_ array: inout [Int], start startIndex: Int, end endIndex: Int) {
    if startIndex < endIndex {
        let p = partition(&array, start: startIndex, end: endIndex)
        quickSort(&array, start: startIndex, end: p - 1)
        quickSort(&array, start: p + 1, end: endIndex)
    }
}

private func quickSort(_ array: [Int]) -> [Int] {
    var temp = array
    quickSort(&temp, start: 0, end: temp.count - 1)
    return temp
}

let n = readLine()!
var unsorted = readLine()!.components(separatedBy: " ").map() {Int($0)!}

let insertionsort = insertionSort(unsorted)
let quicksort = quickSort(unsorted)

print(result)
