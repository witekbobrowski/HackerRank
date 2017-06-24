//  https://www.hackerrank.com/challenges/funny-string

import Foundation

extension Character {
    var ASCII: Int {
        get {
            let s = String(self).unicodeScalars
            return Int(s[s.startIndex].value)
        }
    }
}

extension String {
    var isFunny: Bool {
        get {
            var funny = false
            var previousIndex = self.startIndex
            var index = self.index(after: previousIndex)
            var previousIndexReversed = self.index(before: self.endIndex)
            var indexReversed = self.index(before: previousIndexReversed)
            for _ in 1...(self.characters.count)/2 {
                previousIndex = index
                index = self.index(after: previousIndex)
                previousIndexReversed = indexReversed
                indexReversed = self.index(before: indexReversed)
                if abs(self[index].ASCII - self[previousIndex].ASCII) == abs(self[indexReversed].ASCII - self[previousIndexReversed].ASCII) {
                    funny = true
                } else {
                    return false
                }
            }
            return funny
        }
    }
}

for _ in 0..<Int(readLine()!)!{
    print(readLine()!.isFunny ? "Funny" : "Not Funny")
}
