//  https://www.hackerrank.com/challenges/ctci-making-anagrams

import Foundation

private func anagramCost(aString: String, bString: String ) -> Int {
    var cost = 0
    var occurances: [Character: Int] = [:]
    for character in aString.characters {
        if let _ = occurances[character]{
            occurances[character]! += 1
        } else {
            occurances[character] = 1
        }
    }
    for character in bString.characters{
        if let _ = occurances[character]{
            occurances[character]! -= 1
        } else {
            occurances[character] = -1
        }
    }
    for character in occurances.keys {
        if occurances[character] != 0 {
            cost += abs(occurances[character]!)
        }
    }
    return cost
}

print(anagramCost(aString: readLine()!, bString: readLine()!))
