// https://www.hackerrank.com/challenges/apple-and-orange

import Foundation

let houseConstraints = readLine()!.components(separatedBy: " ").map{ Int($0)! }
let house: (left: Int, right: Int) = (houseConstraints[0], houseConstraints[1])

let treesConstraints = readLine()!.components(separatedBy: " ").map{ Int($0)! }
let appleTree: Int = treesConstraints[0]
let orangeTree: Int = treesConstraints[1]

let numberOfFruits = readLine()!.components(separatedBy: " ").map{ Int($0)! } //useless

let apples: [Int] = readLine()!.components(separatedBy: " ").map{ Int($0)! }
let oranges: [Int] = readLine()!.components(separatedBy: " ").map{ Int($0)! }

private func fruitFellOnHouse(_ house: (left: Int, right: Int), from tree: Int, distance: Int) -> Bool {
    if (tree + distance) >= house.left && (tree + distance) <= house.right{
        return true
    } else {
        return false
    }
}

var numberOfApplesThatFellOnHouse: Int {
    var count: Int = 0
    for apple in apples{
        if fruitFellOnHouse(house, from: appleTree, distance: apple) { count += 1 }
    }
    return count
}
var numberOfOrangesThatFellOnHouse: Int {
    var count: Int = 0
    for orange in oranges{
        if fruitFellOnHouse(house, from: orangeTree, distance: orange) { count += 1 }
    }
    return count
}

print(numberOfApplesThatFellOnHouse)
print(numberOfOrangesThatFellOnHouse)
