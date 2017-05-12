import Foundation

let n = Int(readLine()!)!
var phoneBook: [String: Int] = [:]

for _ in 1...n {
    let person = readLine()!.components(separatedBy: " ").map{ $0 }
    phoneBook[person[0]] = Int(person[1])!
}

private func getNumber(of person: String, in phoneBook: [String: Int]) -> String {
    if let number = phoneBook[person]{
        return "\(person)=\(number)"
    } else {
        return "Not found"
    }
}
// Awkward way to handle unknown number of input lines...
while true {
    if let person = readLine(strippingNewline: false){
        if person.contains("\n"){
            let index = person.index(person.endIndex, offsetBy: -1)
            print(getNumber(of: (person.substring(to: index)), in: phoneBook))
        } else {
            print(getNumber(of: person, in: phoneBook))
            break
        }
    }
}
