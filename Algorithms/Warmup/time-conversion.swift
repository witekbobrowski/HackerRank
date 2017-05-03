import Foundation

// Read the string
let s = readLine()!

private func convertTime(_ time: String) -> String {

    var result = time

    let startRange = time.startIndex..<time.index(time.startIndex, offsetBy: 2)
    let endRange = time.index(time.endIndex, offsetBy: -2)..<time.endIndex

    result.removeSubrange(endRange)

    if time.hasSuffix("AM") {
        if time.hasPrefix("12"){
            result.removeSubrange(startRange)
            result.insert(contentsOf: "00".characters, at: result.index(result.startIndex, offsetBy: 0))
        }
    } else if time.hasSuffix("PM") {
        if var hour = Int(result.substring(to: time.index(time.startIndex, offsetBy: 2))){
            if hour < 12 { hour += 12 }
            result.removeSubrange(startRange)
            result.insert(contentsOf: String(hour).characters, at: result.index(result.startIndex, offsetBy: 0))
        }
    }

    return result
}

print(convertTime(s))
