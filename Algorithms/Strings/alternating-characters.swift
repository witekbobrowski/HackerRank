//  https://www.hackerrank.com/challenges/alternating-characters

import Foundation

private func deletions(in string: String) -> Int {

    var result = 0
    var previous: Character?

    for character in string.characters {
        if previous != nil, previous! == character {
            result += 1
        }
        previous = character
    }

    return result
}

for _ in 0..<Int(readLine()!)! {
    print(deletions(in: readLine()!))
}
