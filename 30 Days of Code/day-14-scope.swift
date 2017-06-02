init(a: [Int]) {
    elements = a.sorted()
}

public func computeDifference(){
    maximumDifference = elements[elements.count - 1] - elements[0]
}
