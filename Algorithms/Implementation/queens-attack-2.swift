// https://www.hackerrank.com/challenges/queens-attack-2

import Foundation

private func obstacleOnAxis(queen: [Int], axis: Int, obstacles: [[Int]], size: Int) -> (Int,Int) {
    var closestObstacle = (-size,size)
    if obstacles.isEmpty { return (0, 0) }
    for obstacle in obstacles {
        if obstacle[axis] == queen[axis] {
            let obstacleOnTheWay = axis == 1 ? obstacle[0] - queen[0] : obstacle[1] - queen[1]
            if obstacleOnTheWay > 0 {
                closestObstacle.1 = closestObstacle.1 > obstacleOnTheWay ? obstacleOnTheWay : closestObstacle.1
            } else {
                closestObstacle.0 = closestObstacle.0 < obstacleOnTheWay ? obstacleOnTheWay : closestObstacle.0
            }
        }
    }
    return closestObstacle == (-size, size) ? (0,0) : (closestObstacle.0 == -size ? 0 : closestObstacle.0 , closestObstacle.1 == size ? 0 : closestObstacle.1)
}

private func obstacleOnDiagonal(queen: [Int], obstacles: [[Int]], size: Int) -> (Int,Int) {
    var closestObstacle = (-size,size)
    if obstacles.isEmpty { return (0, 0) }
    for obstacle in obstacles {
        if obstacle[0] - queen[0] == obstacle[1] - queen[1] {
            let obstacleOnTheWay = obstacle[0] - queen[0]
            if obstacleOnTheWay > 0 {
                closestObstacle.1 = closestObstacle.1 > obstacleOnTheWay ? obstacleOnTheWay : closestObstacle.1
            } else {
                closestObstacle.0 = closestObstacle.0 < obstacleOnTheWay ? obstacleOnTheWay : closestObstacle.0
            }
        }
    }
    return closestObstacle == (-size, size) ? (0,0) : (closestObstacle.0 == -size ? 0 : closestObstacle.0 , closestObstacle.1 == size ? 0 : closestObstacle.1)
}

private func obstacleOnReversedDiagonal(queen: [Int], obstacles: [[Int]], size: Int) -> (Int,Int) {
    var closestObstacle = (-size,size)
    if obstacles.isEmpty { return (0, 0) }
    for obstacle in obstacles {
        if obstacle[0] - queen[0] == -(obstacle[1] - queen[1]) {
            let obstacleOnTheWay = obstacle[0] - queen[0]
            if obstacleOnTheWay > 0 {
                closestObstacle.1 = closestObstacle.1 > obstacleOnTheWay ? obstacleOnTheWay : closestObstacle.1
            } else {
                closestObstacle.0 = closestObstacle.0 < obstacleOnTheWay ? obstacleOnTheWay : closestObstacle.0
            }
        }
    }
    return closestObstacle == (-size, size) ? (0,0) : (closestObstacle.0 == -size ? 0 : closestObstacle.0 , closestObstacle.1 == size ? 0 : closestObstacle.1)
}

private func queensAttack(boardSize: Int, location: [Int], obstacles: [[Int]]) -> Int{

    var result = 0

    // Direction : NORTH
    if location[0] < boardSize {
        let obstacle = obstacleOnAxis(queen: location, axis: 1, obstacles: obstacles, size: boardSize)
        result += obstacle.1 > 0 ? obstacle.1 - 1 : boardSize - location[0]
    }
    // Direction : NORTH-EAST
    if location[0] < boardSize && location[1] < boardSize {
        let obstacle = obstacleOnDiagonal(queen: location, obstacles: obstacles, size: boardSize)
        result += obstacle.1 > 0 ? obstacle.1 - 1 : boardSize - max(location[0], location[1])
    }
    // Direction : EAST
    if location[1] < boardSize {
        let obstacle = obstacleOnAxis(queen: location, axis: 0, obstacles: obstacles, size: boardSize)
        result += obstacle.1 > 0 ? obstacle.1 - 1 : boardSize - location[1]
    }
    // Direction : SOUTH-EAST
    if location[0] > 1 && location[1] < boardSize {
        let obstacle = obstacleOnReversedDiagonal(queen: location, obstacles: obstacles, size: boardSize)
        result += obstacle.0 < 0 ? -obstacle.0 - 1 : min(location[0] - 1, boardSize - location[1])
    }
    // Direction : SOUTH
    if location[0] > 1 {
        let obstacle = obstacleOnAxis(queen: location, axis: 1, obstacles: obstacles, size: boardSize)
        result += obstacle.0 < 0 ? -obstacle.0 - 1 : location[0] - 1
    }
    // Direction : SOUTH-WEST
    if location[0] > 1 && location[1] > 1 {
        let obstacle = obstacleOnDiagonal(queen: location, obstacles: obstacles, size: boardSize)
        result += obstacle.0 < 0 ? -obstacle.0 - 1 : min(location[0], location[1]) - 1
    }
    // Direction : WEST
    if location[1] > 1 {
        let obstacle = obstacleOnAxis(queen: location, axis: 0, obstacles: obstacles, size: boardSize)
        result += obstacle.0 < 0 ? -obstacle.0 - 1 : location[1] - 1
    }
    // Direction : NORTH-WEST
    if location[0] < boardSize && location[1] > 1 {
        let obstacle = obstacleOnReversedDiagonal(queen: location, obstacles: obstacles, size: boardSize)
        result += obstacle.1 > 0 ? obstacle.1 - 1 : min(boardSize - location[0], location[1] - 1)
    }
    return result
}


let info = readLine()!.components(separatedBy: " ").map { Int($0)! }
let queen = readLine()!.components(separatedBy: " ").map { Int($0)! }
var obstacles: [[Int]] = []
for _ in 0..<info[1]{
    obstacles.append(readLine()!.components(separatedBy: " ").map { Int($0)! })
}


print(queensAttack(boardSize: info[0], location: queen, obstacles: obstacles))
