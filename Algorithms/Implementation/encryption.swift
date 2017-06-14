//  https://www.hackerrank.com/challenges/encryption

import Foundation

private func encrypt(message: String) -> String {

    var solution = ""
    let c = Int(ceil(sqrt(Double(message.characters.count))))
    var temp: [[String]] = Array(repeating: [], count: c)

    var row = 0
    for character in message.characters {
        temp[row].append(String(character))
        row = (row + 1) % c
    }

    temp.forEach( { $0.forEach( { solution += $0 } ) ; solution += " "  } )
    return solution
}

var string = "if man was meant to stay on the ground god would have given us roots"

print(encrypt(message: string.replacingOccurrences(of: " ", with: "", options: .literal, range: nil)))
