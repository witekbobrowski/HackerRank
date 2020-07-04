// https://www.hackerrank.com/challenges/jumping-on-the-clouds-revisited

import Foundation

let info = readLine()!.components(separatedBy: " ").map { Int($0)! }
let clouds = readLine()!.components(separatedBy: " ").map { Int($0)! }

private func jumpOn(_ clouds: [Int], distance: Int) -> Int{
    var energy = 100
    var cloud = 0 {
        willSet{
            energy -= clouds[newValue] == 0 ? 1 : 3
        }
    }
    repeat {
        cloud = ((cloud + distance) % clouds.count) == 0 ? 0 :  (cloud + distance) % clouds.count
    } while cloud != 0

    return energy
}

print(jumpOn(clouds, distance: info[1]))
