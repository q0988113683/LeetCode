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
    func maxDepth(_ root: TreeNode?) -> Int {
        guard let node = root else {
            return 0
        }
        
        return 1 + max(maxDepth(node.left),
                       maxDepth(node.right))
    }
}



let a = TreeNode(1,
                 TreeNode(2,
                          TreeNode(4),
                          TreeNode(5)),
                 TreeNode(2,
                          TreeNode(5),
                          nil))


let b = TreeNode(1, nil, TreeNode(4, TreeNode(2, nil, TreeNode(3)), nil))

Solution().maxDepth(a)
