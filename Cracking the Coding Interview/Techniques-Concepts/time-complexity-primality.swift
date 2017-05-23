//  https://www.hackerrank.com/challenges/ctci-big-o

import Foundation;

private func primality(_ number: Int) -> Bool {
    return number == 2 || number > 1 && !(2...Int(sqrt(Double(number)))).contains { number % $0 == 0 }
}

for _ in 0..<Int(readLine()!)!{
    print(primality(Int(readLine()!)!) ? "Prime" : "Not prime")
}
