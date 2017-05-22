class Solution {

    var stack: [Character] = []
    var queue: [Character] = []

    func pushCharacter(c character: Character) {
        stack.append(character)
    }

    func popCharacter() -> Character {
        return stack.removeLast()
    }

    func enqueueCharacter(c character: Character) {
        queue.append(character)
    }

    func dequeueCharacter() -> Character {
        return queue.removeFirst()
    }

}
