import Foundation

let mealCost = Double(readLine()!)!
let taxPercent = Int(readLine()!)!
let tipPercent = Int(readLine()!)!

private func findTotalPrice(of meal: Double, with tip: Int, and tax: Int) -> Int {
    return Int(round(meal + meal * Double(tip)/100.0 + meal * Double(tax)/100.0))
}

print("The total meal cost is \(findTotalPrice(of: mealCost, with: tipPercent, and: taxPercent)) dollars.")
