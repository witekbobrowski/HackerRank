//  https://www.hackerrank.com/challenges/ctci-recursive-staircase

import Foundation;

private func staircase(_ height: Int, _ cache: inout [Int:Int]) -> Int {

    if height < 0 {
        return 0
    } else if height == 0 {
        return 1
    } else if let cachedValue = cache[height] {
        return cachedValue
    } else {
        cache[height] = staircase(height - 1, &cache) + staircase(height - 2, &cache) + staircase(height - 3, &cache)
        return cache[height]!
    }

}

var cache: [Int:Int] = [:]

let n = Int(readLine()!)!

for _ in 0..<n {
    print(staircase(Int(readLine()!)!, &cache))
}
