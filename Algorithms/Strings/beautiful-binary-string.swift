//  https://www.hackerrank.com/challenges/beautiful-binary-string

import Foundation

private func costOfBeingBeautiful(_ string: String) -> Int {

    return string.characters.count - string.replacingOccurrences(of: "010", with: "01").characters.count

}

let n = readLine()!

print(costOfBeingBeautiful(readLine()!))
