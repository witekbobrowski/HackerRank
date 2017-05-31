import Foundation

private func printTest(cancelled lectures: [Int]){
    print(lectures.count)
    for lecture in lectures {
        let n = arc4random_uniform(10) + 3
        let k = arc4random_uniform(n) + 1
        print("\(n) \(k)")
        let x = lecture == 1 ? k - 1 : k + 1
        print("0", terminator: " ")
        for _ in 1..<x {
            print((-Int(arc4random_uniform(1000))), terminator: " ")
        }
        for _ in x..<n  {
            print(arc4random_uniform(1000), terminator: " ")
        }
        print("")
    }
}

printTest(cancelled: [1, 0, 1, 0, 1])
