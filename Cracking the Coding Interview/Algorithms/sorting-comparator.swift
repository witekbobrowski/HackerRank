//  https://www.hackerrank.com/challenges/ctci-comparator-sorting
//
//  Yet another challenge that HackerRank does not let you solve in Swift.
//  I had to write solution in Java, and here it is...
//
//      class Checker implements Comparator<Player> {
//          @Override
//          public int compare(Player one, Player two) {
//              if (one.score != two.score)
//                  return two.score - one.score;
//              else
//                  return one.name.compareTo(two.name);
//          }
//      }
//
//  Here is the Swift solution:
//

import Foundation

class Player: Comparable {

    var name: String
    var score: Int

    init(name: String, score: Int) {
        self.name = name
        self.score = score
    }

    static func < (lhs: Player, rhs: Player) -> Bool {
        if lhs.score != rhs.score {
            return lhs.score < rhs.score
        } else {
            return lhs.name < rhs.name
        }
    }

    static func > (lhs: Player, rhs: Player) -> Bool {
        if lhs.score != rhs.score {
            return lhs.score > rhs.score
        } else {
            return lhs.name > rhs.name
        }
    }

    static func == (lhs: Player, rhs: Player) -> Bool {
        return lhs.score == rhs.score && lhs.name == rhs.name
    }

}

var array: [Player] = []

for _ in 0..<Int(readLine()!)! {
    let info = readLine()!.components(separatedBy: " ").map { $0 }
    array.append(Player(name: info[0], score: Int(info[1])!)
}

array.sorted(by: { $0 > $1 }).forEach( {print("\($0.name) \($0.score)")} )
