// https://www.hackerrank.com/challenges/append-and-delete

import Foundation

private func convert(_ aString: String, to bString: String, in operations: Int) -> Bool{

    var similatiry = 0

    for index in min(aString, bString).characters.indices {
        if aString[index] == bString[index]{
            similatiry += 1
        } else { break }
    }

    // true is difference is simply too big to convert in given number of operations
    let differenceTooBig = aString.characters.count + bString.characters.count - 2 * similatiry > operations
    // true is you can convert string to another in given number of operations or if (operations - difference) is even
    let differenceIsOk = (aString.characters.count + bString.characters.count - 2 * similatiry - operations) % 2 == 0
    // true if there is so many operations that you can delete from empty string to get proper number of operations
    let fewOperationsLeft = aString.characters.count + bString.characters.count - operations < 0

    return !differenceToBig && differenceIsOk || fewOperationsLeft ? true : false
}

print(convert(readLine()!, to: readLine()!, in: Int(readLine()!)!) ? "Yes" : "No")
