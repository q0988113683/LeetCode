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
    func minDepth(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }
        
        func fineMinDepth(_ node: TreeNode?) -> Int? {
            if node == nil {
                return nil
            }
            let minLeft = fineMinDepth(node?.left)
            let minRight = fineMinDepth(node?.right)
            if let minLeft = minLeft, let minRight = minRight {
                return 1 + min(minLeft, minRight)
            } else if let minLeft = minLeft{
                return 1 + minLeft
            } else if let minRight = minRight{
                return 1 + minRight
            }
            return 1
        }
        
        if let left = root?.left,
           let right = root?.right,
           let fineLeft = fineMinDepth(left),
           let fineRight = fineMinDepth(right){
            return 1 + min(fineLeft, fineRight)
            
        }else if let left = root?.left,
                 let fineLeft = fineMinDepth(left){
            return 1 + fineLeft
            
        }else if let right = root?.right,
                 let fineRight = fineMinDepth(right){
            return 1 + fineRight
        }
        
        return 1
    }
    
    
    func minDepth2(_ root: TreeNode?) -> Int {
        guard let root = root else{
            return 0
        }
        
//        typealias nodeLevel = (level: Int, node: TreeNode)
        
        let level = 1
        
        var queue: [(level: Int, node: TreeNode)] = [(level, root)]
        
        while queue.count > 0 {
            let nodeLevel = queue.removeFirst()
            let node = nodeLevel.node
            if  node.left == nil && node.right == nil {
                return nodeLevel.level
            }
            
            if let left = node.left {
                queue.append((nodeLevel.level + 1, left ))
            }
            
            if let right = node.right {
                queue.append((nodeLevel.level + 1, right ))
            }
        }
        return level
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

let c = TreeNode(3,
                 TreeNode(9),
                 TreeNode(20,
                          TreeNode(15),
                          TreeNode(7)))

let d = TreeNode(2,
                 nil,
                 TreeNode(3,
                          nil,
                          TreeNode(4,
                                   nil,
                                   TreeNode(5,
                                            nil,
                                            TreeNode(6)))))

//[3,9,20,null,null,15,7]
//[2,null,3,null,4,null,5,null,6]
Solution().minDepth2(d)
