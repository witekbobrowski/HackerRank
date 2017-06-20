//  https://www.hackerrank.com/challenges/reduced-string

import Foundation

extension String {

    public func reduce() -> String {

        var mirror: [Character?] = self.characters.map( { $0 } )
        var check: Character?
        var flag = true

        while flag {
            flag = false
            for (index, character) in mirror.enumerated() {
                if check != nil, check! == character {
                    mirror[index - 1] = nil
                    mirror[index] = nil
                    check = nil
                    flag = true
                } else {
                    check = character
                }
            }
            check = nil
            let temp = mirror.flatMap({$0})
            mirror = temp
        }

        var result = ""
        mirror.flatMap({$0}).forEach({result.append($0)})
        return result.isEmpty ? "Empty String" : result
    }

}

print(readLine()!.reduce())
