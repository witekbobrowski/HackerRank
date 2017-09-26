//  https://www.hackerrank.com/challenges/minimum-distances

import Foundation

private func minimumDistance(in array: [Int]) -> Int {

    var occurances: [Int:Int] = [:]
    var minimum: Int?
    for (index, number) in array.enumerated() {
        if let position = occurances[number] {
            let distance = index - position
            if let min = minimum {
                minimum = min > distance ? distance : min
            } else {
                minimum = distance
            }
        } else {
            occurances[number] = index
        }
    }
    return minimum ?? -1
}

let n = readLine()!
print(minimumDistance(in: readLine()!.components(separatedBy: " ").map{Int($0)!}))
