//  https://www.hackerrank.com/challenges/countingsort4

import Foundation

private func countingSort(elementsIn array: [(Int, String)]) -> String{

    var occurances: [Int:String] = [:]

    for (index, element) in array.enumerated() {
        if occurances[element.0] != nil {
            occurances[element.0]! += "\(element.1) "
        } else {
            occurances[element.0] = "\(element.1) "
        }
    }

    var result = ""

    for number in 0...99 {
        if let string = occurances[number] {
            result += string
        }
    }

    return result
}

var array: [(Int, String)] = []
let n = Int(readLine()!)!

for _ in 0..<n/2{
    let line = readLine()!
    var item = line.withCString {
        (cStr: UnsafePointer<Int8>) -> (Int, String) in
        let x = atoi(cStr)
        return (Int(x), "-")
    }
    array.append(item)
}

for index in n/2..<n {
    let line = readLine()!
    array.append(line.withCString {
        (cStr: UnsafePointer<Int8>) -> (Int, String) in
        let x = atoi(cStr)
        let pSpc = strchr(cStr, 0x20)!
        let str = String(validatingUTF8: pSpc + 1)!
        return (Int(x), str)
    })
}

print(countingSort(elementsIn: array))
