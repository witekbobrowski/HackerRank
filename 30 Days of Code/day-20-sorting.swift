import Foundation

private func bubbleSort(_ array: inout [Int]) {
    var swaps = 0
    while true {
        var numberOfSwaps = 0
        for index in 0..<array.count - 1 {
            if array[index] > array[index + 1] {
                swap(&array[index], &array[index + 1])
                numberOfSwaps += 1
            }
        }
        if numberOfSwaps == 0 { break }
        swaps += numberOfSwaps
    }
    print("Array is sorted in \(swaps) swaps.")
    print("First Element: \(array.first!)")
    print("Last Element: \(array.last!)")
}

let n = Int(readLine()!)!
var array = readLine()!.components(separatedBy: " ").map{ Int($0)! }

bubbleSort(&array)
