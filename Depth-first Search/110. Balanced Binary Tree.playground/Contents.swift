import UIKit



// * Definition for a binary tree node.
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
    func isBalanced(_ root: TreeNode?) -> Bool {
        if root == nil {
            return true
        }
        
        func checkNode(_ node: TreeNode?) -> Int {
            if node == nil {
                return 0
            }
            
            if node?.left == nil && node?.right == nil{
                return 1
            }
            
            return 1 + max(checkNode(node?.left), checkNode(node?.right))
        }
        
        let left = checkNode(root?.left)
        let right = checkNode(root?.right)
        
        let diff = abs(left - right)
        
        return diff <= 1 && isBalanced(root?.left) && isBalanced(root?.right)
        
        
    }
}
//[3,9,20,null,null,15,7]
//[1,null,2,null,3]
//[1,2,2,3,null,null,3,4,null,null,4]
let a = TreeNode(3,
                 TreeNode(9),
                 TreeNode(20,
                          TreeNode(15),
                          TreeNode(7)))


let b = TreeNode(1,
                 TreeNode(2),
                 nil)

let c = TreeNode(1,
                 TreeNode(2,
                          TreeNode(3,
                                   TreeNode(4),
                                   nil),
                          nil),
                 TreeNode(2,
                          nil,
                          TreeNode(3,
                                   nil,
                                   TreeNode(4))))

let d = TreeNode(2,
                 TreeNode(3,
                          TreeNode(4),
                          nil),
                 nil)
Solution().isBalanced(c)
