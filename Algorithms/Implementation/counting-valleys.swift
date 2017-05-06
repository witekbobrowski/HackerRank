https://www.hackerrank.com/challenges/counting-valleys

import Foundation

let steps = Int(readLine()!)!
let path = readLine()!

private func countValleys(on path: String) -> Int {

    var result = 0
    var position = 0
    var belowSeaLevel: Bool { get { return position < 0 ? true : false } }
    var inValley: Bool = false { willSet { if newValue == true && inValley == false { result += 1 } } }

    for step in path.characters {
        position += step == "U" ? 1 : -1
        inValley = belowSeaLevel ? true : false
    }
    return result
}

print(countValleys(on: path))
