import Foundation;

// read the integer n
let n = Int(readLine()!)!

// read array and map the elements to integer
let arr = readLine()!.components(separatedBy: " ").map{ Int($0)! }

private func compareCandles(_ candles: [Int]) -> Int {
    var result: Int = 0
    var highestCandle: Int = 0
    for candle in candles{
        if candle > highestCandle {
            highestCandle = candle
            result = 1
        } else if candle == highestCandle {
            result += 1
        }
    }
    return result
}

print(compareCandles(arr))
