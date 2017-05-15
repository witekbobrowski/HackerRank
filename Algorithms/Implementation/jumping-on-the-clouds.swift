// https://www.hackerrank.com/challenges/jumping-on-the-clouds

import Foundation

private func jumpOn(_ clouds: [Int]) -> Int{
    var jumps = 0
    var position = 0 { didSet{ jumps += 1 } }
    while position < clouds.count - 2 {
        position += clouds[position + 2] == 1 ? 1 : 2
    }
    if position < clouds.count - 1 { position += 1 }
    return jumps
}

let n = readLine()!
print(jumpOn(readLine()!.components(separatedBy: " ").map { Int($0)! }))
