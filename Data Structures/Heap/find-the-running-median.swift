// https://www.hackerrank.com/challenges/find-the-running-median

import Foundation

enum HeapOrderType {
    case maxHeap
    case minHeap
}

class Heap {

    private var elements: [Int]
    private var type: HeapOrderType

    init(type: HeapOrderType) {
        self.type = type
        self.elements = []
    }

    public func size() -> Int {
        return elements.count
    }

    public func peek() -> Int? {
        return elements.isEmpty ? nil : elements[0]
    }

    public func poll() -> Int? {
        if elements.isEmpty { return nil }
        let element = elements[0]
        elements[0] = elements.removeLast()
        self.heapifyDown()
        return element
    }

    public func add(_ element: Int) {
        elements.append(element)
        self.heapifyUp()
    }

    private func parent(of elementIndex: Int) -> Int? {
        return elementIndex == 0 ? nil : elements[(elementIndex - 1) / 2]
    }

    private func leftChild(of elementIndex: Int) -> Int? {
        let index = elementIndex * 2 + 1
        return index >= elements.count ? nil : elements[index]
    }

    private func rightChild(of elementIndex: Int) -> Int? {
        let index = elementIndex * 2 + 2
        return index >= elements.count ? nil : elements[index]
    }

    private func swap(_ aIndex: Int, with bIndex: Int) {
        Swift.swap(&elements[aIndex], &elements[bIndex])
    }

    public func heapifyUp() {
        var index = elements.count - 1
        while let parent = parent(of: index), compare(a: parent, to: elements[index]) {
            let parentIndex = (index - 1) / 2
            swap(parentIndex, with: index)
            index = parentIndex
        }
    }

    public func heapifyDown() {
        var index = 0
        while let leftChild = leftChild(of: index) {
            var temp = index * 2 + 1
            if let rightChild = rightChild(of: index), !compare(a: rightChild, to: leftChild) {
                temp = index * 2 + 2
            }
            if !compare(a: elements[index], to: elements[temp]) {
                return
            } else {
                swap(index, with: temp)
            }
            index = temp
        }
    }

    private func compare(a: Int, to b: Int) -> Bool {
        switch self.type {
        case .minHeap:
            return a > b
        case .maxHeap:
            return a < b
        }
    }

}

private func add(_ number: Int, to minHeap: Heap, or maxHeap: Heap) {
    if maxHeap.peek() == nil || maxHeap.peek()! > number {
        maxHeap.add(number)
    } else {
        minHeap.add(number)
    }
}

private func balance(_ minHeap: Heap, and maxHeap: Heap) {
    let smallerHeap = minHeap.size() > maxHeap.size() ? maxHeap : minHeap
    let biggerHeap = smallerHeap === minHeap ? maxHeap : minHeap

    if biggerHeap.size() - smallerHeap.size() > 1 {
        smallerHeap.add(biggerHeap.poll()!)
    }
}

private func getMedian(heap minHeap: Heap, heap maxHeap: Heap) -> Double {
    let smallerHeap = minHeap.size() > maxHeap.size() ? maxHeap : minHeap
    let biggerHeap = smallerHeap === minHeap ? maxHeap : minHeap

    if biggerHeap.size() == smallerHeap.size() {
        return Double((biggerHeap.peek() ?? 0) + (smallerHeap.peek() ?? 0)) / 2
    } else {
        return Double(biggerHeap.peek() ?? 0)
    }

}

var minHeap = Heap(type: .minHeap)
var maxHeap = Heap(type: .maxHeap)

for _ in 1...Int(readLine()!)! {
    add(Int(readLine()!)!, to: minHeap, or: maxHeap)
    balance(minHeap, and: maxHeap)
    print(getMedian(heap: minHeap, heap: maxHeap))
}
