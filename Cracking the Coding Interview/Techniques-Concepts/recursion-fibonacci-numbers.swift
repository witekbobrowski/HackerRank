//  https://www.hackerrank.com/challenges/ctci-fibonacci-numbers

import Foundation

func fibonacci (n: Int) -> Int {
    if n == 0 {
        return 0
    } else if n == 1 {
        return 1
    } else {
        return fibonacci(n: n - 2) + fibonacci(n: n - 1)
    }
}

let n = Int(readLine()!)!

print(fibonacci(n: n))
