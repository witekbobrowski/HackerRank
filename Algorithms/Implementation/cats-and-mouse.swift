// https://www.hackerrank.com/challenges/cats-and-a-mouse

import Foundation

let n = Int(readLine()!)!
var locations: [[Int]] = []

for number in 1...n {
    locations.append(readLine()!.components(separatedBy: " ").map { Int($0)! })
}

private func whoCoughtMouse(_ locations: [[Int]]) {
    for query in locations {
        let catADistance = query[2] - query[0] < 0 ? -(query[2] - query[0]) : query[2] - query[0]
        let catBDistance = query[2] - query[1] < 0 ? -(query[2] - query[1]) : query[2] - query[1]
        if catADistance == catBDistance {
            print("Mouse C")
        } else if catADistance < catBDistance {
            print("Cat A")
        } else {
            print("Cat B")
        }
    }
}

whoCoughtMouse(locations)
