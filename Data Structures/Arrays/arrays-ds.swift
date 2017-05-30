//  https://www.hackerrank.com/challenges/arrays-ds

import Foundation

private func printReversedArray(_ array: [Int]) {
    for element in array.reversed() {
        print(element, terminator: " ")
    }
}

let n = Int(readLine()!)!
printReversedArray(readLine()!.components(separatedBy: " ").map{ Int($0)! })
