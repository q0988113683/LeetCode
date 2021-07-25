import UIKit

var str = "Hello, playground"

class Solution {
    func isSubsequence(_ s: String, _ t: String) -> Bool {
        guard !s.isEmpty else {
            return false
        }
        let s = Array(s)
        let t = Array(t)
        
        var index = 0
        for x in t{
            if s[index] == x{
                index = index + 1
                if index == s.count {
                    return true
                }
            }
        }
        return false
    }

}

Solution().isSubsequence("ab", "baab")
