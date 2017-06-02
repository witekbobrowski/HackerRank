class Calculator {

    func power(n: Int, p: Int) throws -> Int {

        var result =  1
        if (n < 0) || (p < 0) {
            throw RangeError.NotInRange("n and p should be non-negative")
        } else if p == 0 {
            return 1
        } else {
            for _ in 0..<p {
                result *= n
            }
        }
        return result
    }

}
