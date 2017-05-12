// https://www.hackerrank.com/challenges/extra-long-factorials
//
//  Ok so i think there is a explanation needed...
//  So it turns out that Swift (3.0.2) does not support BigIntereger. So i guess this is where things
//  get a little bit complicated, and they are complicated enough that they have set the difficulty
//  of this challenge to 'Medium'... Alright, jokes aside, how to solve this problem without BigInt?
//  Map the string version of number to array, then multiply each item in array by desired value.
//  Lastly iterate over the array that now contains bigger values then 9 and get the first digit then
//  insert it to the result. the rest goes to the remainer that you add to the number in every iteration.
//

import Foundation

private func multiply(_ a: String, by b: Int) -> String{

    let temp: [Int] = a.characters.map { Int(String($0))! * b}
    var result = ""
    var remainer = 0

    for number in temp.reversed(){
        let total = number + remainer
        remainer = total / 10
        result.insert(Character(String(total % 10)), at: result.startIndex)
    }
    while remainer > 0 {
        result.insert(Character(String(remainer % 10)), at: result.startIndex)
        remainer /= 10
    }

    return result
}

private func printFactorial(of number: Int){
    var result = "1"
    for n in 1...number{
        result = multiply(result, by: n)
    }
    print(result)
}

printFactorial(of: Int(readLine()!)!)
