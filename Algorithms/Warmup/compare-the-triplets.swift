import Foundation

var alice = 0
var bob = 0

let aliceTriplet = readLine()!.components(separatedBy: " ").map{ Int($0)! }
let bobTriplet = readLine()!.components(separatedBy: " ").map{ Int($0)! }

for index in 0...2{
    if (aliceTriplet[index] > bobTriplet[index]){
        alice += 1
    } else if (aliceTriplet[index] < bobTriplet[index]){
        bob += 1
    }
}

print("\(alice) \(bob)")
