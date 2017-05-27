func levelOrder(root: Node?){
    var queue = [root!]
    while !queue.isEmpty{
        var nextQueue: [Node] = []
        for node in queue {
            print("\(node.data)", terminator: " ")
            if node.left != nil {
                nextQueue.append(node.left!)
            }
            if node.right != nil {
                nextQueue.append(node.right!)
            }
        }
        queue = nextQueue
    }
}
