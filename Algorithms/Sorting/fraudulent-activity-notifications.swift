//  https://www.hackerrank.com/challenges/fraudulent-activity-notifications

import Foundation

private func notifiations(_ expenditure: [Int], days: Int) -> Int {

    var notificationsSent = 0
    var transactions = expenditure.prefix(upTo: days)
    var occurances: [Int:Int] = [:]
    let position = days % 2 == 0 ? days / 2 : (days / 2) + 1

    var median: Double {

        var count = 0

        for number in 0...200 {
            if let times = occurances[number] {
                if count + times < position {
                    count += times
                } else {
                    if count + times > position {
                        return Double(number)
                    } else if count + times == position, days % 2 == 0 {
                        for pair in number + 1...200 {
                            if let _ = occurances[pair] {
                                return Double(number + pair)/2
                            }
                        }
                    }
                    return Double(number)
                }

            }
        }
        return 0.0
    }

    func update(_ day: Int) {
        if occurances[transactions.first!]! == 1 {
            occurances.removeValue(forKey: transactions[transactions.startIndex])
        } else {
            occurances[transactions.first!]! -= 1
        }
        addOccurance(day)
        transactions.removeFirst()
        transactions.append(day)
    }

    func addOccurance(_ day: Int) {
        if occurances[day] != nil {
            occurances[day]! += 1
        } else {
            occurances[day] = 1
        }
    }

    for day in 0..<days {
        addOccurance(expenditure[day])
    }

    for day in days..<expenditure.count {
        if median * 2 <= Double(expenditure[day]) { notificationsSent += 1 }
        update(expenditure[day])
    }

    return notificationsSent
}


let info = readLine()!.components(separatedBy: " ").map {Int($0)!}
let expenditure = readLine()!.components(separatedBy: " ").map {Int($0)!}

print(notifiations(expenditure, days: info[1]))
