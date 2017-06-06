//  https://www.hackerrank.com/challenges/ctci-linked-list-cycle
//
//  Yet another challenge that HackerRank does not let you solve in Swift.
//  I had to write solution in Java, and here it is...
//
//      boolean hasCycle(Node head) {
//          if (head == null) return false;
//          Node current = head;
//          for (int i = 0; i<=100; i++) {
//              if (current.next != null)
//              current = current.next;
//          else return false;
//          }
//          return true;
//      }
//
//  Here is the Swift solution:
//

import Foundation

class Node {
    var data: Int
    var next: Node?

    init(data: Int) {
        self.data = data
    }
}

private func hasCycle(head: Node) -> Bool {
    var current: Node = head
    for _ in 0...100 {
        if current.next != nil {
            current = current.next!
        } else {
            return false
        }
    }
    return true
}

//  Awkward way to create LinkedList manually with Nodes

var head: Node = Node(data: 1)
var nodeTwo: Node = Node(data: 2)
var nodeThree: Node = Node(data: 3)
head.next = nodeTwo
nodeTwo.next = nodeThree
nodeThree.next = nodeTwo

print(hasCycle(head: head) ? "1" : "0")
