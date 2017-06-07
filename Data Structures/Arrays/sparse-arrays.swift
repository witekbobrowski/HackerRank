//  https://www.hackerrank.com/challenges/sparse-arrays

import Foundation

private func occurances(of string: String, in array: [String]) -> Int {
    var count = 0
    for word in array {
        if word == string {
            count += 1
        }
    }
    return count
}

var array: [String] = []
for _ in 1...Int(readLine()!)! {
    array.append(readLine()!)
}

for _ in 1...Int(readLine()!)! {
    print(occurances(of: readLine()!, in: array))
}
