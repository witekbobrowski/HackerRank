//  https://www.hackerrank.com/challenges/correctness-invariant
//
//  Yet another challenge that HackerRank does not let you solve in Swift.
//  I had to write solution in Java, and here it is...
//
//    import java.io.*;
//    import java.util.*;
//
//    public class Solution {
//
//        public static void insertionSort(int[] A){
//        for(int i = 1; i < A.length; i++){
//        int value = A[i];
//        int j = i - 1;
//        while(j >= 0 && A[j] > value){
//        A[j + 1] = A[j];
//        j = j - 1;
//        }
//        A[j + 1] = value;
//        }
//
//        printArray(A);
//        }
//
//
//        static void printArray(int[] ar) {
//        for(int n: ar){
//        System.out.print(n+" ");
//        }
//        }
//        public static void main(String[] args) {
//        Scanner in = new Scanner(System.in);
//        int n = in.nextInt();
//        int[] ar = new int[n];
//        for(int i=0;i<n;i++){
//        ar[i]=in.nextInt();
//        }
//        insertionSort(ar);
//        }
//    }
//
//  Here is the Swift solution:
//

import Foundation

private func insertionSort(_ array: [Int]) {
    var temp = array
    for index in 1..<temp.count {
        let value = temp[index]
        var j = index - 1
        while j >= 0 && temp[j] > value {
            temp[j + 1] = temp[j]
            j -= 1
        }
        temp[j + 1] = value
    }
    temp.forEach( { print($0, terminator: " ") } )
}

let n = readLine()!
insertionSort(readLine()!.components(separatedBy: " ").map {Int($0)!})
