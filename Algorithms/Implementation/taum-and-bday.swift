//  https://www.hackerrank.com/challenges/taum-and-bday

import  Foundation

private func buy(gifts: [Int],for price: [Int]) -> Int {

    var minimalCost = 0

    let costOfBlackItems = gifts[0] * price[0]
    let costOfConvertingToBlackItem = gifts[0] * (price[1] + price[2])
    minimalCost += costOfBlackItems < costOfConvertingToBlackItem ? costOfBlackItems : costOfConvertingToBlackItem

    let costOfWhiteItems = gifts[1] * price[1]
    let costOfConvertingToWhiteItem = gifts[1] * (price[0] + price[2])
    minimalCost += costOfWhiteItems < costOfConvertingToWhiteItem ? costOfWhiteItems : costOfConvertingToWhiteItem

    return minimalCost
}


let n = Int(readLine()!)!

for _ in 0..<n {
    print(buy(gifts:
readLine()!.components(separatedBy: " ").map {Int($0)!}, for:
readLine()!.components(separatedBy: " ").map {Int($0)!}))
}
