import UIKit




func elevenToPowOf(_ n: Int) -> String{
    if n <= 0 {
        return "1"
    }
    var power = n
    var result = "11"
    while power > 1 {
        
        power = power - 1
        let previousResult: String = result
        let currentResult: String = result + "0"
        var newResult = ""
        var carry = 0
        
        let reversedResult: Array<Character> = Array(currentResult).reversed()
        let reversedPreviousResult: Array<Character> = Array(previousResult).reversed()
        
        for e in reversedResult.enumerated() {
            
            guard reversedPreviousResult.count > e.offset else {
                newResult = String(e.element) + newResult
                break
            }
            guard let rDigits = Int(String(e.element)) , let pDigits = Int(String(reversedPreviousResult[e.offset])) else {
                break
            }
        
            var digits = rDigits + pDigits + carry
            carry = Int(digits / 10)
            digits = digits % 10
            newResult = String(digits) + newResult
        }
        result = newResult
    }
    
    return result
}


let s = elevenToPowOf(6)

print(s.filter{ $0 == "1"}.count)
