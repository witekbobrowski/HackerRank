//  https://www.hackerrank.com/challenges/hackerrank-in-a-string

import Foundation

private func hackerrank(in string: String) -> Bool {

    var hackerrank = "hackerrank"

    for character in string.characters {
        if hackerrank.isEmpty {
            break
        } else if character == hackerrank[hackerrank.startIndex] {
            hackerrank.remove(at: hackerrank.startIndex)
        }
    }

    return hackerrank.isEmpty
}

for _ in 1...Int(readLine()!)! {
    print(hackerrank(in: readLine()!) ? "YES" : "NO")
}
