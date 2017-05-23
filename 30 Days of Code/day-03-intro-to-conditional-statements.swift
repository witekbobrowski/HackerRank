import Foundation

private func checkIfNumberIsWeird(_ number: Int) -> String {
    if number % 2 == 1 {
        return "Weird"
    } else {
        switch number {
        case 6...20:
            return "Weird"
        default:
            return "Not Weird"
        }
    }
}

print(checkIfNumberIsWeird(Int(readLine()!)!))
