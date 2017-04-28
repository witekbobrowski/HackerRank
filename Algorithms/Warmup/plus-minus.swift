import Foundation

// number of elements
let n = Int(readLine()!)!

// read array and map the elements to integer
let arr = readLine()!.components(separatedBy: " ").map{ Int($0)! }

func checkElements (of array: [Int]) -> (positive: Double, negative: Double, zeroes: Double) {
    var positiveNumbers: [Int] = []
    var negativeNumbers: [Int] = []
    var zeroes: [Int] = []

    for element in array {
        if element == 0 {
            zeroes.append(element)
        } else if element > 0 {
            positiveNumbers.append(element)
        } else {
            negativeNumbers.append(element)
        }
    }

    func calculatePercentage (of numbers: [Int], from array: [Int]) -> Double {
        return Double(numbers.count) / Double(array.count)
    }

    return (calculatePercentage(of: positiveNumbers, from: array), calculatePercentage(of: negativeNumbers, from: array), calculatePercentage(of: zeroes, from: array))
}

let result = checkElements(of: arr)

print(result.0)
print(result.1)
print(result.2)
