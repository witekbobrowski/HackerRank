//  https://www.hackerrank.com/challenges/insertionsort2

import Foundation

private func insertionSort(_ array: [Int]) -> [Int] {

    var temp = array
    for index in temp.indices {
        if index == 0 { continue }
        if temp[index] < temp[index - 1] {
            swap(&temp[index], &temp[index - 1])
            var i = index
            while true {
                if i == 1 { break }
                if temp[i - 1] < temp[i - 2] {
                    swap(&temp[i - 1], &temp[i - 2])
                } else {
                    break
                }
                i -= 1
            }
        }
        temp.forEach( { print($0, terminator: " ") } )
        print("")
    }
    return temp
}

let n = readLine()!
let sorted = insertionSort(readLine()!.components(separatedBy: " ").map {Int($0)!})
