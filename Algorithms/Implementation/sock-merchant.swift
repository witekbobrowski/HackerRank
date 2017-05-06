// https://www.hackerrank.com/challenges/sock-merchant

import Foundation

let integer = Int(readLine()!)!
let socks = readLine()!.components(separatedBy: " ").map { Int($0)! }

private func countPairs(of items: [Int]) -> Int {
    var result = 0
    var array = items
    repeat {
        let temp = array[0]
        array.remove(at: 0)
        for index in array.indices {
            if temp == array[index] {
                result += 1
                array.remove(at: index)
                break
            }
        }
    } while array.count > 1
    return result
}

print(countPairs(of: socks))
