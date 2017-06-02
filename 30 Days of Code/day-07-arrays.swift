import Foundation

private func reversedArray(_ array: [Int]) -> [Int]{
    var result: [Int] = []
    for number in array{
        result.insert(number, at: result.startIndex)
    }
    return result
}

let n = Int(readLine()!)!
let results = reversedArray(readLine()!.components(separatedBy: " ").map { Int($0)! })

for result in results {
    print(result, terminator: " ")
}
