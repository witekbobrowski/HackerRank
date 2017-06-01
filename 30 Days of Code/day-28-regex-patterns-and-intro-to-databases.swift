import Foundation

private func sort(database: [[String]]){
    database.sorted(by: {$0[0] < $1[0]}).forEach( { $0[1].range(of: ".+@gmail\\.com$", options: .regularExpression) != nil ? print($0[0]) : print("", terminator: "") })
}

let n = Int(readLine()!)!
var database: [[String]] = []

for _ in 1...n {
    database.append(readLine()!.components(separatedBy: " ").map { $0 })
}

sort(database: database)
