//  https://www.hackerrank.com/challenges/ctci-contacts
//
//  Yet another challenge that HackerRank does not let you solve in Swift.
//  I had to write solution in Java, and here it is...
//
//    Set<Integer> numbers = new TreeSet<Integer>();
//
//    boolean isDuplicate(int data) {
//        if (numbers.contains(data))
//        return true;
//        else
//        numbers.add(data);
//        return false;
//    }
//
//    boolean checkBST(Node node, int min, int max) {
//        try {
//        if (isDuplicate(node.data))
//        return false;
//        else if (node == null)
//        return true;
//        else if (node.data > min && node.data < max && checkBST(node.left, min, node.data) && checkBST(node.right, node.data, max))
//        return true;
//        else
//        return false;
//        } catch (NullPointerException e) {
//        return true;
//        }
//    }
//
//    boolean checkBST(Node root) {
//        return checkBST(root, Integer.MIN_VALUE, Integer.MAX_VALUE);
//    }
//
//  Here is the Swift solution:
//

import Foundation

var numbers: Set<Int> = []

private func isDuplicate(data: Int) {
    if numbers.contains(data){
        return false
    } else {
        numbers.insert(data)
        return true
    }
}

private func checkBST(node: Node, min: Int, max: Int) {
    if isDuplicate(data: node.data) {
        return false
    } else if node == nil {
        return true
    } else if node.data > min, node.data < max, checkBST(node: node.left, min: min, max: node.data), checkBST(node: node.right, min: node.data, max: max){
        return true
    } else {
        return false
    }
}

private func checkBST(root: Node) {
    return checkBST(node: root, min: Int.min, max: Int.max)
}
