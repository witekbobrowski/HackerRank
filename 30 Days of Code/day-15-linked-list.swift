func insert(head: Node?, data: Int!) -> Node? {

    let newNode = Node(data: data)

    if head == nil {
        return newNode
    } else if head?.next == nil {
        head!.next = newNode
    } else {
        _ = insert(head: head?.next, data: data)
    }
    return head
}
