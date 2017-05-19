//  https://www.hackerrank.com/challenges/ctci-ransom-note

import Foundation

private func ransomNote(from magazine: [String], note: [String] ) -> String {

    if magazine.count < note.count { return "No" }

    var words: [String: Int] = [:]

    for word in magazine {
        if let _ = words[word] {
            words[word]! += 1
        } else {
            words[word] = 1
        }
    }

    for word in note {
        if let count = words[word]{
            if count == 1 {
                words.removeValue(forKey: word)
            } else {
                words[word]! -= 1
            }
        } else {
            return "No"
        }
    }

    return "Yes"
}

let info = readLine()!

print(ransomNote(from: readLine()!.components(separatedBy: " ").map { $0 }, note: readLine()!.components(separatedBy: " ").map { $0 }))
