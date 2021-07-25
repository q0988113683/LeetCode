import UIKit

var str = "Hello, playground"



//Definition for a binary tree node.
public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

class Solution {
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        
        guard let root = root else {
            return []
        }

        func getNode(_ node: TreeNode?) -> [Int] {
            
            guard let node = node else {
                return []
            }
             
            if node.right == nil && node.left == nil{
                return [node.val]
            }
            
            if node.left != nil && node.right != nil{
                return getNode(node.left) + [node.val] + getNode(node.right)
            }else if node.left != nil {
                return getNode(node.left) + [node.val]
            }else if node.right != nil{
                return [node.val] + getNode(node.right)
            }
            return []
        }
        
        
        return getNode(root.left) + [root.val] + getNode(root.right)
    }
}


let node = TreeNode(1,
                    nil,
                    TreeNode(2,
                             TreeNode(3, nil, nil),
                             nil))
Solution().inorderTraversal(node)
