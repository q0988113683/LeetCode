import UIKit


class Solution {
    func countBits(_ n: Int) -> [Int] {
        guard n > 0 else {
            return [0]
        }
        var currentNumber = 1
        var result: [Int] = [0]
        var binaryNum: [Int: Int] = [1: 0, 0: 0]
        while n >= currentNumber {
            
            
            if let num = binaryNum[currentNumber % 2] {
                binaryNum[currentNumber % 2] = num + (currentNumber % 2)
            }
            
            
            while (n > 0) {
                
                // storing remainder in binary array
                if let num = binaryNum[n % 2] {
                    binaryNum[n % 2] = num + (n % 2)
                }
                n = n / 2;
                i = i + 1
            }
            
            
            let binary = Array(String(currentNumber, radix: 2))
            let count = binary.filter{ $0 != "0" }.count
            result.append(count)
            currentNumber = currentNumber + 1
        }

        return result
    }
}


//["bella","label","roller"]

Solution().countBits(5)

String(15, radix: 2)

var n = 15
var i = 0
var binaryNum: [Int: Int] = [1: 0, 0: 0]
while (n > 0) {
    
    // storing remainder in binary array
    if let num = binaryNum[n % 2] {
        binaryNum[n % 2] = num + (n % 2)
    }
    n = n / 2;
    i = i + 1
}

print(binaryNum)
