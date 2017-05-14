// https://www.hackerrank.com/challenges/non-divisible-subset

import Foundation

private func findSubset(of integers: [Int], nonDivisibleBy number: Int) -> [Int] {
    var subset: [Int] = []
    var remainers: [Int: Int] = [:]
    let temp: [Int] = integers.map { $0 % number }
    temp.forEach { if let _ = remainers[$0] { remainers[$0]! += 1 } else { remainers[$0] = 1 } }

    for key in remainers.keys{
        if number % 2 == 0, key == number/2 {
            subset.append(key)
        } else if key == 0 {
            subset.append(key)
        } else if let remainer = remainers[number - key], !subset.contains(number - key){
            if remainer < remainers[key]!{
                for _ in 0..<remainers[key]!{
                    subset.append(key)
                }
            }
        } else if !subset.contains(number - key) {
            for _ in 0..<remainers[key]!{
                subset.append(key)
            }
        }
    }
    return subset
}

let n: [Int] = readLine()!.components(separatedBy: " ").map { Int($0)! }
print(findSubset(of: readLine()!.components(separatedBy: " ").map { Int($0)! }, nonDivisibleBy: n[1]).count)
