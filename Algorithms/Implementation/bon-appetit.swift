// https://www.hackerrank.com/challenges/bon-appetit

import Foundation

let info = readLine()!.components(separatedBy: " ").map { Int($0)! }
let receipt = readLine()!.components(separatedBy: " ").map { Int($0)! }
let cost = Int(readLine()!)!

private func splitCost(of receipt: [Int], without item: Int) -> Int {

    var sum = 0
    for index in receipt.indices {
        sum += index != item ? receipt[index] : 0
    }
    return sum/2
}

let result = splitCost(of: receipt, without: info[1])

print(cost == result ? "Bon Appetit" : cost - result)
