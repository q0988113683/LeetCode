import UIKit

var str = "Hello, playground"


class Solution {
    func mySqrt(_ x: Int) -> Int {
        if x < 1 {
            return 0
        }
        
        if x <= 3{
            return 1
        }
        
        var result = 2
        let maxValue = x / 2
        while result <= maxValue {
            let compare = result * result
            
            if compare < x {
                result = result + 1
            }else if compare == x {
                return result
            } else{
                return result - 1
            }
        }
        return result - 1
    }
    
    
    func mySqrt1(_ x: Int) -> Int {
        if x < 1 {
            return 0
        }
        
        if x <= 3{
            return 1
        }
        
        var left = 0
        var right = x / 2
        while(left <= right) {
            let mid: Int = (left + right) / 2
            if mid * mid == x {
                return mid
            } else if mid * mid > x {
                right = mid - 1
            } else {
                left = mid + 1
            }
        }
        
        return right
    }
}

Solution().mySqrt1(10)
