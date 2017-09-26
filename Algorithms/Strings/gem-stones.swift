//  https://www.hackerrank.com/challenges/gem-stones

import Foundation

private func gemstones(in rocks: [String]) -> Int {

    var elements: Set<Character>?

    for rock in rocks {
        if elements != nil {
            elements = elements!.intersection(rock.characters)
        } else {
            elements = Set(rock.characters)
        }
    }

    return elements?.count ?? 0
}

var rocks: [String] = []

for _ in 1...Int(readLine()!)! {
    rocks.append(readLine()!)
}

print(gemstones(in: rocks))
