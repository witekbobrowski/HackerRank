// https://www.hackerrank.com/challenges/magic-square-forming

import Foundation

let rowOne = readLine()!.components(separatedBy: " ").map { Int($0)! }
let rowTwo = readLine()!.components(separatedBy: " ").map { Int($0)! }
let rowThree = readLine()!.components(separatedBy: " ").map { Int($0)! }

let matrix = [rowOne, rowTwo, rowThree]

private func formMagicSquare(from square: [[Int]]) -> (magicSquare: [[Int]], cost: Int) {

    var result = (square, 81)

    let magicSquares = [[[8, 1, 6], [3, 5, 7], [4, 9, 2]],
                        [[6, 1, 8], [7, 5, 3], [2, 9, 4]],
                        [[4, 9, 2], [3, 5, 7], [8, 1, 6]],
                        [[2, 9, 4], [7, 5, 3], [6, 1, 8]],
                        [[8, 3, 4], [1, 5, 9], [6, 7, 2]],
                        [[4, 3, 8], [9, 5, 1], [2, 7, 6]],
                        [[6, 7, 2], [1, 5, 9], [8, 3, 4]],
                        [[2, 7, 6], [9, 5, 1], [4, 3, 8]]]

    for magicSquare in magicSquares{
        var cost = 0
        for row in 0...2 {
            if magicSquare[row] != square[row] {
                for number in 0...2 {
                    if magicSquare[row][number] != square[row][number] {
                        let difference = magicSquare[row][number] - square[row][number]
                        cost += difference > 0 ? difference : -difference
                    }
                }
            }
        }
        result = result.1 < cost ? result : (magicSquare, cost)
    }
    return result
}

print(formMagicSquare(from: matrix).cost)
