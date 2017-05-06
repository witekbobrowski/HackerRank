// https://www.hackerrank.com/challenges/sock-merchant

import Foundation

let pages = Int(readLine()!)!
let requestedPage = Int(readLine()!)!

private func pagesToTurn(_ pages: Int, to page: Int) -> Int {
    var result = 0
    if page > pages/2 {
        result = pages % 2 == 0 ? (pages - page + 1) / 2 : (pages - page) / 2
    } else {
        result = page / 2
    }
    return result
}

print(pagesToTurn(pages, to: requestedPage))
