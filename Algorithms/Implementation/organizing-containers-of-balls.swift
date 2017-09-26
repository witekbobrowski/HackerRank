//  https://www.hackerrank.com/challenges/organizing-containers-of-balls

import Foundation

private func swappingBalls(_ containers: [[Int]]) -> String {

    var ballsInCointainer: [Int] = []
    var ballsTypeCount: [Int] = []


    for container in containers.indices {
        for ballType in containers[container].indices {
            if ballsInCointainer.indices.contains(container) {
                ballsInCointainer[container] += containers[container][ballType]
            } else {
                ballsInCointainer.insert(containers[container][ballType], at: container)
            }
            if ballsTypeCount.indices.contains(ballType) {
                ballsTypeCount[ballType] += containers[container][ballType]
            } else {
                ballsTypeCount.insert(containers[container][ballType], at: ballType)
            }
        }

    }

    for container in ballsInCointainer {
        var typeFound = -1
        for type in ballsTypeCount.indices {
            if ballsTypeCount[type] == container {
                typeFound = type
            }
        }
        if typeFound != -1 {
            ballsTypeCount.remove(at: typeFound)
        } else {
            return "Impossible"
        }
    }
    return "Possible"
}

let n = Int(readLine()!)!

for _ in 0..<n {
    let m = Int(readLine()!)!
    var containers: [[Int]] = []
    for _ in 0..<m {
        containers.append(readLine()!.components(separatedBy: " ").map { Int($0)! })
    }
    print(swappingBalls(containers))
}
