import Foundation

private func countConsecutiveOnesOf(binary int: Int) -> Int{
    var result = 0
    var temp = 0 {
        willSet {
            result = newValue > result ? newValue : result
        }
    }
    for digit in String(int, radix: 2).characters {
        temp = digit == "1" ? temp + 1 : 0
    }
    return result
}

print(countConsecutiveOnesOf(binary: Int(readLine()!)!))
