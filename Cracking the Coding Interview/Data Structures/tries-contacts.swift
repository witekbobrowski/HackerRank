//  https://www.hackerrank.com/challenges/ctci-contacts

import Foundation

class Node: Hashable {

    var character: Character
    var children: [Character:Node]
    var completeWordsCount: Int



    init() {
        self.character = "*"
        self.children = [:]
        self.completeWordsCount = 0
    }

    init(character: Character) {
        self.character = character
        self.children = [:]
        self.completeWordsCount = 0
    }

    public func addChild(_ child: Node) {
        children[child.character] = child
    }

    public var hashValue: Int { return character.hashValue }

    static func == (lhs: Node, rhs: Node) -> Bool {
        return lhs.character == rhs.character
    }

}

class Trie {

    var head: Node

    init() {
        self.head = Node()
    }

    public func add(word: String) {
        var current: Node = head
        for character in word.characters {
            current.completeWordsCount += 1
            if let child = current.children[character] {
                current = child
            } else {
                let new: Node = Node(character: character)
                current.addChild(new)
                current = new
            }
        }
        current.completeWordsCount += 1
    }

    public func find(partial: String) -> Int {
        var current: Node = head
        for character in partial.characters {
            if let child = current.children[character] {
                current = child
            } else {
                return 0
            }
        }
        return current.completeWordsCount
    }

}

var contacts = Trie()

for _ in 1...Int(readLine()!)! {
    let query = readLine()!
    if query[query.startIndex] == "a" {
        let index = query.index(query.startIndex, offsetBy: 4)
        contacts.add(word: query.substring(from: index))
    } else {
        let index = query.index(query.startIndex, offsetBy: 5)
        print(contacts.find(partial: query.substring(from: index)))
    }
}
