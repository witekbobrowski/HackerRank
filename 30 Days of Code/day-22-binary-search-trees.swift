func getHeight(root: Node?) -> Int {

    var leftHeight = 0
    var rightHeight = 0

    if root!.left != nil {
        leftHeight = getHeight(root: root!.left) + 1
    }
    if root!.right != nil {
        rightHeight = getHeight(root: root!.right) + 1
    }
    return leftHeight > rightHeight ? leftHeight : rightHeight
}
