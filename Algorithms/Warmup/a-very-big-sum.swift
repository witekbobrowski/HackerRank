import Foundation

// number of elements
let n = Int(readLine()!)!

// read array and map the elements to integer
let arr = readLine()!.components(separatedBy: " ").map{ Int($0)! }

var sum: Int64 = 0

for number in arr {
    sum += number
}

print(sum)
