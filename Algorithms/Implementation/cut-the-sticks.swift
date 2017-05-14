// https://www.hackerrank.com/challenges/cut-the-sticks

import Foundation

private func cutSticks(_ sticks: [Int]){
    var temp = sticks
    while !temp.isEmpty{
        print(temp.count)
        let lengthOfCut = temp.sorted()[0]
        for index in temp.indices.reversed() {
            temp[index] -= lengthOfCut
            if temp[index] <= 0 { temp.remove(at: index)}
        }
    }
}
let n = readLine()!
cutSticks(readLine()!.components(separatedBy: " ").map { Int($0)! })
