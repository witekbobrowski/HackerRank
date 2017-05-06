// https://www.hackerrank.com/challenges/electronics-shop

import Foundation

let info = readLine()!.components(separatedBy: " ").map { Int($0)! }
let keyboards = readLine()!.components(separatedBy: " ").map { Int($0)! }
let drives = readLine()!.components(separatedBy: " ").map { Int($0)! }

private func findBestMatch(of items: [Int], and otherItems: [Int], for max: Int) -> Int {
    var result = 0
    if items.sorted()[0] + otherItems.sorted()[0] > max { return -1 }
    for item in items {
        for otherItem in otherItems {
            let price = item + otherItem
            result = (price <= max && price > result) ? price : result
        }
    }
    return result
}
print(findBestMatch(of: keyboards, and: drives, for: info[0]))
