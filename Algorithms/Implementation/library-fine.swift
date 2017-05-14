// https://www.hackerrank.com/challenges/library-fine

import Foundation

private enum Delay{
    case None
    case Days(Int)
    case Months(Int)
    case Years(Int)
}

private func calculateDelay(between date: [Int], and secondDate: [Int]) -> Delay {
    if date[2] > secondDate[2] {
        return Delay.Years(date[2] - secondDate[2])
    } else if date[2] == secondDate[2] {
        if date[1] >= secondDate[1] + 1 {
            return Delay.Months(date[1] - secondDate[1])
        } else if date[1] == secondDate[1] + 1, date[0] < secondDate[0] {
            return Delay.Days(31 - secondDate[0] + date[0])
        } else if date[1] == secondDate[1], date[0] > secondDate[0] {
            return Delay.Days(date[0] - secondDate[0])
        }
    }
    return Delay.None
}

private func calculateFineForBook(returned: [Int], deadline: [Int]) -> Int {
    switch calculateDelay(between: returned, and: deadline) {
    case .None:
        return 0
    case .Days(let days):
        return days * 15
    case .Months(let months):
        return months * 500
    case .Years(let years):
        return years * 10000
    }
}

let returned = readLine()!.components(separatedBy: " ").map { Int($0)! }
let deadline = readLine()!.components(separatedBy: " ").map { Int($0)! }

print(calculateFineForBook(returned: returned, deadline: deadline))
