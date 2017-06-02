//
//  Since HackerRank does not let you solve this challenge in Swift with protocols,
//  I had to write another solution in Java, and here it is...
//
//      class Calculator implements AdvancedArithmetic {
//
//          public int divisorSum(int n) {
//              int result = n;
//
//              for(int i = 1; i < n; i++)
//                  result += n % i == 0 ? i : 0;
//
//              return result;
//          }
//
//      }
//
//  But here is the Swift solution:
//

import Foundation

protocol AdvancedArithmetic {
    func divisorSum(_ n: Int) -> Int
}

class Calculator: AdvancedArithmetic {

    func divisorSum(_ n: Int) -> Int {
        var result = n
        for divisor in 1..<n {
            result += n % divisor == 0 ? divisor : 0
        }
        return result
    }

}

let myCalculator: AdvancedArithmetic = Calculator()

if let calculator = myCalculator as? AdvancedArithmetic {
    print("I implemented: AdvancedArithmetic")
    print(calculator.divisorSum(Int(readLine()!)!))
}
