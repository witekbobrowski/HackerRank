class Student: Person {

    var testScores: [Int]

    init(firstName: String, lastName: String, identification: Int, scores: [Int]){
        self.testScores = scores
        super.init(firstNameString: firstName, lastNameString: lastName, identificationNumber: identification)
    }

    func calculate() -> Character {
    	var sum = 0
        testScores.forEach { sum += $0 }
        switch sum / testScores.count {
        case 90...100:
            return "O"
        case 80..<90:
            return "E"
        case 70..<80:
            return "A"
        case 55..<70:
            return "P"
        case 40..<55:
            return "D"
        default:
            return "T"
        }
    }
}
