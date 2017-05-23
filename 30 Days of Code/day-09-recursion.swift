import Foundation

private func recursiveFactorial(_ n: Int) -> Int{
    return n - 1 > 0 ? n * recursiveFactorial(n-1) : n
}

print(recursiveFactorial(Int(readLine()!)!))
