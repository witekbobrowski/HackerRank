//  https://www.hackerrank.com/challenges/camelcase

import Foundation

private func countCamelCase(in sentence: String) -> Int {

    var count = 1

    let upperCaseLetters = CharacterSet.uppercaseLetters

    for character in sentence.characters {
        if let scalar = UnicodeScalar(String(character)) {
            count += upperCaseLetters.contains(scalar) ? 1 : 0
        }
    }

    return count
}


print(countCamelCase(in: readLine()!))
