// https://www.hackerrank.com/challenges/tutorial-intro

import Foundation;

private func printIndex(of element: Int, in array: [Int]){
    for index in array.indices {
        if array[index] == element {
            print(index)
        }
    }
}

let element = Int(readLine()!)!
let n = Int(readLine()!)!

printIndex(of: element, in: readLine()!.components(separatedBy: " ").map { Int($0)! })
