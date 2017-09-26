//  https://www.hackerrank.com/challenges/mars-exploration

import Foundation

private func changedLetters(in message: String) -> Int {

    var count = 0
    var temp = 0
    for character in message.characters {
        if temp == 0, character != "S" {
            count += 1
        }
        if temp == 1, character != "O" {
            count += 1
        }
        if temp == 2, character != "S" {
            count += 1
        }

        temp += 1
        temp = temp % 3
    }

    return count
}

print(changedLetters(in: readLine()!))
