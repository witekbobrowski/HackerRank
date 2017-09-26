//  https://www.hackerrank.com/challenges/insertionsort1

import Foundation

private func insertionSort(_ array: [Int]) -> [Int] {

    let unsorted = array.last!
    var temp = array
    for index in temp.indices {
        if index == temp.count - 1 {
            temp[array.count - index - 1] = unsorted
            break
        } else if temp[array.count - index - 2] > unsorted {
            temp[array.count - index - 1] = temp[array.count - index - 2]
        } else {
            temp[array.count - index - 1] = unsorted
            break
        }
        temp.forEach( { print($0, terminator: " ") } )
        print("")
    }
    temp.forEach( { print($0, terminator: " ") } )
    return temp
}

let n = readLine()!
let sorted = insertionSort(readLine()!.components(separatedBy: " ").map {Int($0)!})
