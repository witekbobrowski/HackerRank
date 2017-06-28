//  https://www.hackerrank.com/challenges/find-the-median

import Foundation

private func median(in array: [Int]) -> Int {
    if array.count % 2 == 1 {
        return array.sorted()[array.count/2]
    } else {
        return (array.sorted()[array.count/2] + array.sorted()[array.count/2 - 1])/2
    }
}

let n = readLine()!
print(median(in: readLine()!.components(separatedBy: " ").map {Int($0)!}))
