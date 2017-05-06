// https://www.hackerrank.com/challenges/migratory-birds

import Foundation

let birdsCount = readLine()!

private func sortBirds(_ flock: [Int]) -> [Int: Int] {
    var result: [Int: Int] = [:]
    for bird in flock {
        if let count = result[bird]{
            result[bird] = count + 1
        } else {
            result[bird] = 1
        }
    }
    return result
}

private func pointMostPopularType(of birds: [Int: Int]) -> Int{
    var result: Int?
    for type in birds.keys {
        if let mostPopularType = result{
            if birds[mostPopularType]! < birds[type]! {
                result = type
            } else if birds[mostPopularType]! == birds[type], mostPopularType > type {
                result = type
            }
        } else {
            result = type
        }
    }
    return result!
}

print(pointMostPopularType(of: sortBirds(readLine()!.components(separatedBy: " ").map { Int($0)! })))
