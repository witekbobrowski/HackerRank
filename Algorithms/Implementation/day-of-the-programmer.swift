// https://www.hackerrank.com/challenges/day-of-the-programmer

import Foundation

let year = Int(readLine()!)!

private func isLeapYear(_ year: Int) -> Bool {
    return (year % 400 == 0) || ((year % 4 == 0) && (year % 100 != 0)) ? true : false
}

private func isJulianLeapYear(_ year: Int) -> Bool {
    return (year % 4 == 0) ? true : false
}

private func findDayOfTheProgrammerInRussia(in year: Int) -> String {

    var months = [("01", 31), ("02", 28), ("03", 31), ("04", 30), ("05", 31), ("06", 30),
                    ("07", 31), ("08", 31), ("09", 30), ("10", 31), ("11", 30), ("12", 31)]

    switch year {
    case 1700..<1918:
        months[1] = isJulianLeapYear(year) ? ("02", 29) : ("02", 28)
    case 1918:
        months[1] = ("02", 15)
    default:
        months[1] = isLeapYear(year) ? ("02", 29) : ("02", 28)
    }

    var sum = 0
    for month in months {
        if sum + month.1 < 256 {
            sum += month.1
        } else {
            return "\(256 - sum).\(month.0).\(year)"
        }
    }

    return ""
}

print(findDayOfTheProgrammerInRussia(in: year))
