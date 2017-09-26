// https://www.hackerrank.com/challenges/designer-pdf-viewer

import Foundation

let info = readLine()!.components(separatedBy: " ").map { Int($0)! }
let word = readLine()!

private func computeHighlightedArea(of word: String, with heights: [Int]) -> Int {

    let characters = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]

    var tallestLetter = 0

    for character in word.characters {
        tallestLetter = heights[characters.index(of: String(character))!] < tallestLetter ? tallestLetter : heights[characters.index(of: String(character))!]
    }

    return tallestLetter * word.characters.count
}

print(computeHighlightedArea(of: word, with: info))
