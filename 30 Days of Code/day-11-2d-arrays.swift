import Foundation;

private func findHourglassWithMaximumSum(in array: [[Int]]) -> Int {
    var sum = -63 // lowest possible
    for x in array.indices {
        for y in array[x].indices {
            if  x + 2 <= array.count - 1, y + 2 <= array[x].count - 1{
                let temp = array[x][y] + array[x][y+1] + array[x][y+2] + array[x+1][y+1] + array[x+2][y] + array[x+2][y+1] + array[x+2][y+2]
                sum = temp > sum ? temp : sum
            }
        }
    }
    return sum
}

var matrix: [[Int]] = []
for _ in 1...6{
    matrix.append(readLine()!.components(separatedBy: " ").map { Int($0)! })
}

print(findHourglassWithMaximumSum(in: matrix))
