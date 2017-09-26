// https://www.hackerrank.com/challenges/big-sorting

import Foundation

extension String {

    static func < (left: String, right: String) -> Bool {
        if left.endIndex == right.endIndex {
            if let aInt = Int(left), let bInt = Int(right){
                return aInt < bInt
            } else {
                for index in left.characters.indices {
                    if left[index] != right[index] {
                        return left[index] < right[index]
                    }
                }
                return false
            }
        }
        return left.endIndex < right.endIndex
    }

}

var unsorted: [String] = []

for _ in 0..<Int(readLine()!)!{
    unsorted.append(readLine()!)
}

unsorted.sorted {$0 < $1}.forEach({print($0)})
