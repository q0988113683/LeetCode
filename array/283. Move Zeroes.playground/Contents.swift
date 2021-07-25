import UIKit

class Solution {
    func moveZeroes(_ nums: inout [Int]) {
        func swap(_ nums: inout [Int], index: Int, subIndex: Int){
            //swap
            if index == subIndex {return}
            nums[index] = nums[index] + nums[subIndex]
            nums[subIndex] = nums[index] - nums[subIndex]
            nums[index] = nums[index]  - nums[subIndex]
        }
        var zeroIndex = 0
        var nonZeroIndex = 0
        for num in nums {
            if num != 0 {
                swap(&nums, index: zeroIndex, subIndex: nonZeroIndex)
                zeroIndex = zeroIndex + 1
            }
            nonZeroIndex = nonZeroIndex + 1
        }
    }
}

var nums = [1]
Solution().moveZeroes(&nums)
