// https://www.hackerrank.com/challenges/beautiful-days-at-the-movies

import Foundation

let info = readLine()!.components(separatedBy: " ").map{ Int($0)! }

private func reverseInt(_ number: Int) -> Int {
    var temp = number
    var reversed = 0
    var remainer = 0
    while (temp > 0){
        remainer = temp % 10
        reversed = reversed * 10 + remainer
        temp = temp / 10
    }
    return reversed
}

private func findBeautifulDays(from start: Int, to end: Int, k: Int) -> [Int]{
    var beautifulDays: [Int] = []
    for day in start...end{
        if abs(reverseInt(day) - day) % k == 0 {
            beautifulDays.append(day)
        }
    }
    return beautifulDays
}

print(findBeautifulDays(from: info[0], to: info[1], k: info[2]).count)
