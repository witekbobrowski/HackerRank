//  https://www.hackerrank.com/challenges/runningtime

import Foundation

private func insertionSort(_ array: [Int]) -> [Int] {

    var temp = array
    var shifts = 0
    for index in temp.indices {
        if index == 0 { continue }
        if temp[index] < temp[index - 1] {
            swap(&temp[index], &temp[index - 1])
            shifts += 1
            var i = index
            while true {
                if i == 1 { break }
                if temp[i - 1] < temp[i - 2] {
                    swap(&temp[i - 1], &temp[i - 2])
                    shifts += 1
                } else {
                    break
                }
                i -= 1
            }
        }
    }
    print(shifts)
    return temp
}
let n = readLine()!
let sorted = insertionSort(readLine()!.components(separatedBy: " ").map{Int($0)!})
