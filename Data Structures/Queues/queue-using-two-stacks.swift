//  https://www.hackerrank.com/challenges/queue-using-two-stacks

import Foundation

class Node<Element> {
    var data: Element
    var next: Node?

    init(data: Element) {
        self.data = data
    }
}

class Stack<Element> {

    private var top: Node<Element>?

    public func isEmpty() -> Bool {
        return top == nil
    }

    public func peek() -> Element? {
        return top?.data
    }

    public func push(data: Element) {
        let new = Node(data: data)
        if !isEmpty() {
            new.next = top
        }
        top = new
    }

    public func pop() -> Element? {
        let data = top?.data
        if let node = top?.next {
            top = node
        } else {
            top = nil
        }
        return data
    }

}

class Queue<Element> {

    private var enqueueStack = Stack<Element>()
    private var dequeueStack = Stack<Element>()

    private func transferData(){
        while !enqueueStack.isEmpty(){
            dequeueStack.push(data: enqueueStack.pop()!)
        }
    }

    public func isEmpty() -> Bool {
        return enqueueStack.isEmpty() && dequeueStack.isEmpty()
    }

    public func peek() -> Element? {
        if isEmpty() {
            return nil
        } else if dequeueStack.isEmpty() {
            transferData()
        }
        return dequeueStack.peek()
    }

    public func add(data: Element) {
        enqueueStack.push(data: data)
    }

    public func remove() -> Element? {
        if isEmpty() {
            return nil
        } else if dequeueStack.isEmpty() {
            transferData()
        }
        return dequeueStack.pop()
    }

}

var queue = Queue<Int>()

for _ in 0..<Int(readLine()!)! {
    let info = readLine()!.components(separatedBy: " ").map { Int($0)! }
    switch info[0]{
    case 1:
        queue.add(data: info[1])
    case 2:
        let _ = queue.remove()
    default:
        print(queue.peek()!)
    }
}
