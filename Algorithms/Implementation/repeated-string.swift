// https://www.hackerrank.com/challenges/repeated-string

import Foundation

private func findNumberOfAs(in string: String, till n: Int) -> Int {
    var count = 0

    for character in string.characters {
        count += character == "a" ? 1 : 0
    }

    func getTheRestOfAs(_ rest: Int) -> Int {
        var count = 0
        var iteration = 0
        for character in string.characters {
            if iteration < rest {
                count += character == "a" ? 1 : 0
                iteration += 1
            } else { break }
        }
        return count
    }

    if count == string.characters.count {
        return n
    } else {
        count = (n/string.characters.count) * count + getTheRestOfAs(n % string.characters.count)
    }
    return count
}

print(findNumberOfAs(in: readLine()!, till: Int(readLine()!)!))
