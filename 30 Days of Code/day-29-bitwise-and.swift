import Foundation

private func bitwiseAND(n: Int, k: Int) -> Int {
    var highestMultiplication = 0
    for element in 1...n {
        for anotherElement in element..<n  {
            if element & (anotherElement + 1) < k {
                highestMultiplication = highestMultiplication < element & (anotherElement + 1) ? element & (anotherElement + 1) : highestMultiplication
            }
        }
    }
    return highestMultiplication
}

for _ in 0..<Int(readLine()!)!{
    let info = readLine()!.components(separatedBy: " ").map { Int($0)! }
    print(bitwiseAND(n: info[0], k: info[1]))

}
