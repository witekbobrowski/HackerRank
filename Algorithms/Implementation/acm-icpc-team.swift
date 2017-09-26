//  https://www.hackerrank.com/challenges/acm-icpc-team

import  Foundation

private func findTeam(_ people: [[Int]]) -> (topics: Int, teamCount: Int) {

    var maxTopics = 0
    var teams: [[Int]] = []

    mainLoop: for person in people.indices {
        for anotherPerson in person..<people.count {
            var toppicsInCommon = 0
            for topic in people[person].indices {
                if people[person][topic] | people[anotherPerson][topic] == 1 {
                    toppicsInCommon += 1
                }
            }
            if toppicsInCommon > maxTopics {
                maxTopics = toppicsInCommon
                teams = [[person, anotherPerson]]
            } else if toppicsInCommon == maxTopics {
                teams.append([person, anotherPerson])
            }
        }
    }

    return (topics: maxTopics, teamCount: teams.count)
}

let info = readLine()!.components(separatedBy: " ").map {Int($0)!}
var people: [[Int]] = []

for _ in 0..<info[0] {
    people.append(readLine()!.characters.map {Int(String($0))!})
}
let result = findTeam(people)
print("\(result.0)\n\(result.1)")
