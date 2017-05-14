// https://www.hackerrank.com/challenges/big-sorting
//
//  WARNING!!! This solution does not pass the Test Case #7 "Terminated due to timeout 2s"
//

import Foundation

extension String {
    func compare(to string: String, order: ComparisonResult) -> Bool {
        switch order {
        case .orderedAscending:
            if self.endIndex < string.endIndex {
                return true
            } else if self.endIndex > string.endIndex {
                return false
            } else {
                if self == string {
                    return false
                } else if let aInt = Int(self), let bInt = Int(string){
                    return aInt < bInt ? true : false
                } else {
                    for index in self.characters.indices {
                        if self[index] != string[index] {
                            return self[index] < string[index] ? true : false
                        }
                    }
                    return false
                }
            }
        case .orderedDescending:
            if self.endIndex > string.endIndex {
                return true
            } else if self.endIndex < string.endIndex {
                return false
            } else {
                if self == string {
                    return false
                } else if let aInt = Int(self), let bInt = Int(string){
                    return aInt > bInt ? true : false
                } else {
                    for index in self.characters.indices {
                        if self[index] != string[index] {
                            return self[index] > string[index] ? true : false
                        }
                    }
                    return false
                }
            }
        case .orderedSame :
            return self == string ? true : false
        }
    }
}

var unsorted: [String] = []
for _ in 0..<Int(readLine()!)!{
    unsorted.append(readLine()!)
}

unsorted.sorted(by: { $0.compare(to: $1, order: .orderedAscending) }).forEach({print($0)})
