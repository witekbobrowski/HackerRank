//  https://www.hackerrank.com/challenges/ctci-ice-cream-parlor

import Foundation

private func getIceCreams(from iceCreams: [Int], for money: Int) {

    var candidates: [Int:Int] = [:]

    for (id, price) in iceCreams.enumerated() {
        if price < money{
            if money % 2 == 0, money / 2 == price, let match = candidates[price] {
                print(id < match ? "\(id + 1) \(match + 1)" : "\(match + 1) \(id + 1) ")
                return
            } else {
                candidates[price] = id
            }
        }
    }

    for candidate in candidates {
        if let match = candidates[money - candidate.key], candidate.value != match {
            print(candidate.value < match ? "\(candidate.value + 1) \(match + 1)" : "\(match + 1) \(candidate.value + 1) ")
            return
        }
    }

}

for _ in 1...Int(readLine()!)! {
    let money = Int(readLine()!)!
    let _ = Int(readLine()!)!
    let iceCreams = readLine()!.components(separatedBy: " ").map { Int($0)! }
    getIceCreams(from: iceCreams, for: money)
}
