// Input: nums = [-1,0,1,2,-1,-4]
// Output: [[-1,-1,2],[-1,0,1]]
// Explanation: 
// nums[0] + nums[1] + nums[2] = (-1) + 0 + 1 = 0.
// nums[1] + nums[2] + nums[4] = 0 + 1 + (-1) = 0.
// nums[0] + nums[3] + nums[4] = (-1) + 2 + (-1) = 0.
// The distinct triplets are [-1,0,1] and [-1,-1,2].
// Notice that the order of the output and the order of the triplets does not matter.

class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        guard nums.count >= 3 else { return [] }
        var nums = nums.sorted { $0 < $1 } // nlogn sort => [-4, -1, -1, 0, 1, 2]
        let target = 0
        var result = [[Int]]()
        
        for index in 0..<nums.count-2 {
            // avoid duplicate
            if index > 0, nums[index-1] == nums[index] {
                continue
            }

            var left = index + 1
            var right = nums.count - 1

            while left < right {
                var threeSum = nums[index] + nums[left] + nums[right]
                if threeSum < target {
                    left += 1
                } else if threeSum > target {
                    right -= 1
                } else if threeSum == target {
                    result.append([nums[index], nums[left], nums[right]])
                    // avoid duplicate
                    while left < right, nums[left] == nums[left+1] {
                        left += 1
                    }
                    while left < right, nums[right] == nums[right-1] {
                        right -= 1
                    }
                    left += 1
                    right -= 1
                }
            }
        }
                    
        return result

    }
}

// time: O n^2, space O(1) 


class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        var result: [[Int]] = []
        let sortedNums = nums.sorted()
        
        for i in 0..<sortedNums.count {
            // Skip duplicates for the first number
            if i > 0 && sortedNums[i] == sortedNums[i - 1] {
                continue
            }
            
            var second = i + 1
            var third = sortedNums.count - 1
            
            while second < third {
                let sum = sortedNums[i] + sortedNums[second] + sortedNums[third]
                
                if sum == 0 {
                    result.append([sortedNums[i], sortedNums[second], sortedNums[third]])
                    
                    // Skip duplicates for the second number
                    while second < third && sortedNums[second] == sortedNums[second + 1] {
                        second += 1
                    }
                    
                    // Skip duplicates for the third number
                    while second < third && sortedNums[third] == sortedNums[third - 1] {
                        third -= 1
                    }
                    
                    second += 1
                    third -= 1
                } else if sum < 0 {
                    second += 1
                } else {
                    third -= 1
                }
            }
        }
        
        return result
    }
}



class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        var result: [[Int]] = []
        let sortedNums = nums.sorted() // Sort the array to simplify handling duplicates
        
        for i in 0..<sortedNums.count {
            // Skip duplicates for the first number
            if i > 0 && sortedNums[i] == sortedNums[i - 1] {
                continue
            }
            
            var second = i + 1
            var third = sortedNums.count - 1
            
            while second < third {
                let sum = sortedNums[i] + sortedNums[second] + sortedNums[third]
                
                if sum == 0 {
                    result.append([sortedNums[i], sortedNums[second], sortedNums[third]])
                    
                    // Skip duplicates for the second number
                    while second < third && sortedNums[second] == sortedNums[second + 1] {
                        second += 1
                    }
                    
                    // Skip duplicates for the third number
                    while second < third && sortedNums[third] == sortedNums[third - 1] {
                        third -= 1
                    }
                    
                    // Move both pointers inward after processing a valid triplet
                    second += 1
                    third -= 1
                } else if sum < 0 {
                    second += 1 // Increase the sum
                } else {
                    third -= 1 // Decrease the sum
                }
            }
        }
        
        return result
    }
}
