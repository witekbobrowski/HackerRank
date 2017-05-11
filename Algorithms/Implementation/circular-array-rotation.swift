// https://www.hackerrank.com/challenges/circular-array-rotation
//
//  Apparently this challenge does not want you to solve an actual problem of rotating an array.
//  Rotating array is very easy with swift, since you can do it in one line:
//
//      private func rightCircularRotation(_ array: inout [Int]) {
//          array.insert(array.popLast()!, at: array.startIndex)
//      }
//
//  I was getting timeout in Test Cases #5, #9, #10, #12, #13, $14 while the rest cases where ok.
//  So i looked through the comments in Discussions tab, and people were suggesting only printing value at
//  calculated index withot rotating the array...
//
//  So here it is ladies and gentlemen, the glorious solution that is able to satisfy 100% of Test Cases...
//

import Foundation

let nkq = [3, 2, 3] //readLine()!.components(separatedBy: " ").map { Int($0)! }
var integers = [1, 2, 3] //readLine()!.components(separatedBy: " ").map { Int($0)! }

private func printFakeRightCircularRotation(of array: [Int], at index: Int){
    print(array[(nkq[0] - (nkq[1] % nkq[0]) + index) % nkq[0]])
}

for _ in 1...nkq[2] {
    printFakeRightCircularRotation(of: integers, at: Int(readLine()!)!)
}
