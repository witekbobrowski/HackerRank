//  https://www.hackerrank.com/challenges/ctci-connected-cell-in-a-grid

import Foundation

class Cell {

    var x: Int
    var y: Int

    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }

    public func neighbours(in matrix: [[Int]]) -> [Cell] {
        var neighbours: [Cell] = []
        if y > 0 && x > 0, matrix[self.y - 1][self.x - 1] == 1 { neighbours.append(Cell(x: self.x - 1, y: self.y - 1)) }
        if y > 0, matrix[self.y - 1][self.x] == 1 { neighbours.append(Cell(x: self.x, y: self.y - 1)) }
        if y > 0 && x < matrix[y].count - 1, matrix[self.y - 1][self.x + 1] == 1 { neighbours.append(Cell(x: self.x + 1, y: self.y - 1)) }
        if x > 0, matrix[self.y][self.x - 1] == 1 { neighbours.append(Cell(x: self.x - 1, y: self.y)) }
        if x < matrix[y].count - 1, matrix[self.y][self.x + 1] == 1 { neighbours.append(Cell(x: self.x + 1, y: self.y)) }
        if y < matrix.count - 1 && x > 0, matrix[self.y + 1][self.x - 1] == 1 { neighbours.append(Cell(x: self.x - 1, y: self.y + 1)) }
        if y < matrix.count - 1, matrix[self.y + 1][self.x] == 1 { neighbours.append(Cell(x: self.x, y: self.y + 1)) }
        if y < matrix.count - 1 && x < matrix[y].count - 1, matrix[self.y + 1][self.x + 1] == 1 { neighbours.append(Cell(x: self.x + 1, y: self.y + 1)) }
        return neighbours
    }

}

private func findGreatestRegion(in matrix: [[Int]]) -> Int {

    var greatestRegion = 0
    var temp = matrix

    func getRegionSize(for cell: Cell) -> Int {

        var region = 0
        var neighbours = [cell]

        while !neighbours.isEmpty {
            let current = neighbours.removeFirst()
            if temp[current.y][current.x] == 0 { continue }
            temp[current.y][current.x] = 0
            region += 1
            neighbours.append(contentsOf: current.neighbours(in: temp))
        }

        return region
    }

    for (y, row) in temp.enumerated() {
        for x in row.indices {
            let region = getRegionSize(for: Cell(x: x, y: y))
            greatestRegion = greatestRegion < region ? region : greatestRegion
        }
    }

    return greatestRegion
}

var matrix: [[Int]] = []

let n = Int(readLine()!)!
let _ = Int(readLine()!)!
for _ in 1...n {
    let row = readLine()!.components(separatedBy: " ").map { Int($0)! }
    matrix.append(row)
}

print(findGreatestRegion(in: matrix))
