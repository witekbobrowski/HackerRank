import Foundation

private func lonelyInteger(in array: [Int]) -> Int {
    var value = 0
    for integer in array {
        value ^= integer
    }
    return value
}

let n = readLine()!
print(lonelyInteger(in: readLine()!.components(separatedBy: " ").map { Int($0)! }))
