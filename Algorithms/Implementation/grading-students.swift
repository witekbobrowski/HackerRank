// https://www.hackerrank.com/challenges/grading

import Foundation

// number of grades
let n = Int(readLine()!)!

var grades: [Int] = []

for _ in 1...n {
    let grade = Int(readLine()!)!
    grades.append(grade)
}

private func evaluateGrades(_ grades: [Int]) -> [Int] {
    var result: [Int] = []
    for grade in grades {
        if grade >= 38, (grade % 5) > 2 {
                result.append(grade + (5 - (grade % 5)))
        } else {
            result.append(grade)
        }
    }
    return result
}

let evaluatedGrades = evaluateGrades(grades)

for grade in evaluatedGrades {
    print(grade)
}
