//  https://www.hackerrank.com/challenges/the-love-letter-mystery

import Foundation

private func palindrome(_ string: [UnicodeScalar]) -> Int {
    
    var result = 0

    for index in 0..<string.count/2 {
        result += abs(Int(string[index].value) - Int(string[string.count - index - 1].value))
    }

    return result

}

for _ in 1...Int(readLine()!)!{
    print(palindrome(readLine()!.unicodeScalars.reversed()))
}
