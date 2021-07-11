import UIKit

var str = "Hello, playground"


class Solution {
    func strStr(_ haystack: String, _ needle: String) -> Int {
        guard !needle.isEmpty else {
            return 0
        }
        
        guard haystack.contains(needle) else {
            return -1
        }
       
        var start = 0
        var end = needle.count - 1
        
        while end < haystack.count {
            let haystackFirstIndex = haystack.index(haystack.startIndex, offsetBy: start)
            let haystackEndIndex = haystack.index(haystack.startIndex, offsetBy: end)
            
            let substring = haystack[haystackFirstIndex...haystackEndIndex]
            print(substring)
            if substring == needle{
                return start
            }
            
            start = start + 1
            end = end + 1
        }
       
        return -1
    }
}


let haystack = "polo"
let needle = "polo"

Solution().strStr(haystack, needle)

//"hello"
//"ll"
//"mississippi"
//"mississippi"
