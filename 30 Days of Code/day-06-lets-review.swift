import Foundation
import Darwin

func printEvenAndOdd(string: String){
        var even = ""
        var odd = ""
        var position = 0
        for char in string.characters {
            //print(index)
            if position % 2 == 1 {
                odd.append(char)
            } else {
                even.append(char)
            }
            position += 1
        }
        print("\(even) \(odd)")
}

for _ in 1...Int(readLine()!)! {
    let inputString = readLine()!
    printEvenAndOdd(string: inputString)
}
