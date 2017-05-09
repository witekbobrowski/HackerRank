import Foundation

let n = Int(readLine()!)!

private func printMultiplicationTable(for n: Int) {
    for number in 1...10 {
        print("\(n) x \(number) = \(n * number)")
    }
}

printMultiplicationTable(for: n)
