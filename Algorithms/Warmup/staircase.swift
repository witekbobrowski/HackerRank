import Foundation

// read the integer n
let n = Int(readLine()!)!

// print the staircase

func printStaircase(_ size: Int){
    for number in 1...n {
        var result: String = ""
        var spaces: Int = n - number
        var hashes: Int = number
        while ((spaces != 0) || (hashes != 0)) {
            if spaces > 0 {
                result.append(" ")
                spaces -= 1
            } else if hashes > 0 {
                result.append("#")
                hashes -= 1
            }
        }
        print(result)
    }
}

printStaircase(n)
