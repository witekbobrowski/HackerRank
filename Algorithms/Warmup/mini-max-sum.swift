import Foundation;

// read array and map the elements to integer
let arr = readLine()!.components(separatedBy: " ").map{ Int($0)! }


private func findMinAndMaxSum(_ numbers: [Int]) -> (Int64, Int64)? {
    var max: Int64?
    var min: Int64?

    func compare(_ a: Int64, to b: Int64) -> Bool {
        return a > b
    }

    for numberIgnored in numbers {
        var sum: Int64 = 0
        for number in numbers {
            sum += number
        }
        sum -= numberIgnored

        if let maxFound = max {
            if compare(sum, to: maxFound){ max = sum }
        } else {
            max = sum
        }

        if let minFound = min {
            if compare(minFound, to: sum){ min = sum }
        } else {
            min = sum
        }
    }

    return (min! , max!)
}

if let result = findMinAndMaxSum(arr) {
    print("\(result.0) \(result.1)")
}
