import Foundation

let n = Int(readLine()!)!

private func recursiveFactorial(_ n: Int) -> Int{
    var result = n
    if n - 1 > 0 {
        result = n * recursiveFactorial(n-1)
    }
    return result
}

print(recursiveFactorial(n))
