//  https://www.hackerrank.com/challenges/ctci-merge-sort

import Foundation

private func mergeSort<Element: Comparable>(array: inout [Element]) -> Int64 {

    var temp = array

    func mergeAndCount(start: Int, end: Int) -> Int64 {

        for index in start...end {
            temp[index] = array[index]
        }

        var i = start
        var j = ((start + end) / 2) + 1
        var inversions: Int = 0

        for index in start...end {
            if i > (start + end) / 2 {
                array[index] = temp[j]
                j += 1
            } else if j > end {
                array[index] = temp[i]
                i += 1
            } else if temp[i] <= temp[j] {
                array[index] = temp[i]
                i += 1
            } else {
                array[index] = temp[j]
                inversions += (start + end) / 2 - i + 1
                j += 1
            }
        }

        return Int64(inversions)
    }

    func sortAndCount(start: Int, end: Int) -> Int64 {
        if start >= end {
            return 0
        } else {
            let mid = (start + end) / 2
            return sortAndCount(start: start, end: mid) + sortAndCount(start: mid + 1, end: end) + mergeAndCount(start: start, end: end)
        }
    }

    return sortAndCount(start: array.startIndex, end: array.endIndex - 1)
}


for _ in 1...Int(readLine()!)! {
    let n = Int(readLine()!)!
    var array = [Int](repeating: 0, count: n)
    let scan = Scanner(string: readLine()!)

    for index in 0..<n {
        scan.scanInt(&array[index])
    }

    print(mergeSort(array: &array))
}
