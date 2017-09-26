//  https://www.hackerrank.com/challenges/pangrams

import Foundation

private func isPanagram(_ string: String) -> Bool {

    var alphabet: Set<Character> = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]

    for character in string.uppercased().characters {
        if alphabet.isEmpty{
            return true
        } else {
            alphabet.remove(character)
        }
    }

    return alphabet.isEmpty
}

print(isPanagram(readLine()!) ? "pangram" : "not pangram")
