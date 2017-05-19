//  https://www.hackerrank.com/challenges/ctci-linked-list-cycle

import Foundation

private func balanced(brackets: [Character]) -> Bool {
    if brackets.count % 2 == 1 { return false }
    var stack: [Character] = []
    for bracket in brackets {
        switch bracket {
        case "(":
            stack.append(")")
        case "[":
            stack.append("]")
        case "{":
            stack.append("}")
        default:
            if stack.isEmpty || bracket != stack.popLast() {
                return false
            }
        }
    }
    return stack.isEmpty
}

let n = Int(readLine()!)!
for _ in 1...n{
    print(balanced(brackets: readLine()!.characters.map { $0 }) ? "YES" : "NO" )
}
