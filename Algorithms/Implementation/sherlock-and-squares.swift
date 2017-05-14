// https://www.hackerrank.com/challenges/sherlock-and-squares

import Foundation

private func numberOfSquareIntegersBetween(_ a: Int, and b: Int) -> Int {
    var integers = 0

    if Int(ceil(sqrt(Double(a)))) <= Int(floor(sqrt(Double(b)))){
        for _ in Int(ceil(sqrt(Double(a))))...Int(floor(sqrt(Double(b)))){
            integers += 1
        }
    }
    return integers
}

let n = Int(readLine()!)!
for _ in 0..<n {
    let test = readLine()!.components(separatedBy: " ").map { Int($0)! }
    print(numberOfSquareIntegersBetween(test[0], and: test[1]))
}
