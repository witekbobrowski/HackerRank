//  https://www.hackerrank.com/challenges/ctci-coin-change

import Foundation

private func change(for amount: Int, with coins: [Int]) -> Int {

    var matrix: [[Int]] = []
    for (index, coin) in coins.enumerated() {
        matrix.append([])
        for value in 0...amount {
            if index == 0 {
                matrix[index].append(value % coin == 0 ? 1 : 0)
            } else if value >= coin {
                matrix[index].append(matrix[index - 1][value] + matrix[index][value - coin])
            } else {
                matrix[index].append(matrix[index - 1][value])
            }

        }
    }
    return matrix.last!.last!
}

let info = readLine()!.components(separatedBy: " ").map { Int($0)! }
print(change(for: info[0], with: readLine()!.components(separatedBy: " ").map { Int($0)! } ))
