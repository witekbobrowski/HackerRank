import Foundation

let n = Int(readLine()!)!
let array = readLine()!.components(separatedBy: " ").map { Int($0)! }

private func reversedArray(_ array: [Int]) -> [Int]{
    var result: [Int] = []
    for number in array{
        result.insert(number, at: result.startIndex)
    }
    return result
}

let results = reversedArray(array)

for result in results {
    print(result, terminator: " ")
}
