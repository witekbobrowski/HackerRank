import Foundation

// read the integer n
let n = Int(readLine()!)!

// declare 2d array
var arr: [[Int]] = []

// read array row-by-row
for _ in 0..<n {
    arr.append(readLine()!.components(separatedBy: " ").map{ Int($0)! })
}

func calculateDiagonalDifference (_ matrix:[[Int]]) -> Int {
    var primaryDiagonal: Int = 0
    var secondaryDiagonal: Int = 0

    for index in 0..<n {
        primaryDiagonal += matrix[index][index]
        secondaryDiagonal += matrix[index][n-1-index]
    }
    if (primaryDiagonal - secondaryDiagonal) > 0 {
        return primaryDiagonal - secondaryDiagonal
    } else {
        return -(primaryDiagonal - secondaryDiagonal)
    }
}

print(calculateDiagonalDifference(arr))
