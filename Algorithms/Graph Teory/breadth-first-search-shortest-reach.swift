//  https://www.hackerrank.com/challenges/bfsshortreach

import Foundation

class Node: Equatable, Hashable {

    var id: Int
    private var connections: Set<Node>

    init(id: Int) {
        self.id = id
        self.connections = []
    }

    public func connect(to node: Node) {
        self.connections.insert(node)
    }

    public func getConnections() -> Set<Node> {
        return connections
    }

    public func breakConnection(with node: Node) {
        connections.remove(node)
    }

    public func breakAllConnections() -> Set<Node> {
        let temp = self.connections
        for connection in connections {
            connection.breakConnection(with: self)
        }
        self.connections = []
        return temp
    }

    public var hashValue: Int { return id }

    static func == (lhs: Node, rhs: Node) -> Bool {
        return lhs.id == rhs.id
    }

}

class Graph {

    private var nodes: [Node]

    init(n: Int, edges: [[Int]]) {
        self.nodes = []
        for node in 1...n {
            self.nodes.append(Node(id: node))
        }
        for edge in edges {
            nodes[edge[0] - 1].connect(to: nodes[edge[1] - 1])
            nodes[edge[1] - 1].connect(to: nodes[edge[0] - 1])
        }
    }

    public func getNode(id: Int) -> Node{
        return nodes[id - 1]
    }

    public func getNodes() -> [Node]{
        return nodes
    }

    public func printDistaces(from id: Int) {
        var distances = Array(repeating: -1, count: self.nodes.count)
        var nodes: Set<Node> = [self.getNode(id: id)]
        var queue: Set<Node> = []
        var currentDistance = 0
        repeat {
            queue = []
            while !nodes.isEmpty {
                let current = nodes.removeFirst()
                if distances[current.id - 1] == -1 {
                    distances[current.id - 1] = currentDistance
                    queue.formUnion(current.breakAllConnections())
                }
            }
            currentDistance += 6
            nodes = queue
        } while !queue.isEmpty
        distances.forEach( { if $0 != 0 { print($0, terminator: " ") } } )
    }
}

for test in 1...Int(readLine()!)! {
    let info = readLine()!.components(separatedBy: " ").map { Int($0)! }
    var edges: [[Int]] = []
    for edge in 1...info[1]{
        edges.append(readLine()!.components(separatedBy: " ").map { Int($0)! })
    }
    let start = Int(readLine()!)!
    let graph = Graph(n: info[0], edges: edges)
    graph.printDistaces(from: start)
    print("")
}
