//  https://www.hackerrank.com/challenges/dynamic-array

import Foundation

private func dynamicArray(n: Int, queries: [[Int]]) {

    var seqList: [[Int]] = []
    var lastAnswer = 0

    for _ in 1...n {
        seqList.append([])
    }

    for query in queries {

        switch query[0] {
        case 1:
            let seq = ((query[1] ^ lastAnswer) % n)
            seqList[seq].append(query[2])
        default:
            let seq = ((query[1] ^ lastAnswer) % n)
            lastAnswer = seqList[seq][query[2] % seqList[seq].count]
            print(lastAnswer)
        }

    }

}

let info = readLine()!.components(separatedBy : " ").map { Int($0)! }
var queries: [[Int]] = []

for _ in 1...info[1] {
    queries.append(readLine()!.components(separatedBy : " ").map { Int($0)! })
}

dynamicArray(n: info[0], queries: queries)
