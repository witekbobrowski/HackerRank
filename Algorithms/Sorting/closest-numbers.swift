//  https://www.hackerrank.com/challenges/closest-numbers/submissions/code/48094033

import Foundation

private func closest(numbers array: [Int]) {

    let temp = array.sorted()
    var distance = Int.max
    var index = 0

    for i in 1..<temp.count {
        if abs(temp[i] - temp[i - 1]) < distance {
            distance = abs(temp[i] - temp[i - 1])
            index = i - 1
        }
    }

    for i in index..<temp.count - 1 {
        if abs(temp[i + 1] - temp[i]) == distance {
            print("\(temp[i]) \(temp[i + 1])", terminator: " ")
        }
    }

}

let n = readLine()!
closest(numbers: readLine()!.components(separatedBy: " ").map() {Int($0)!})
