class Solution {
    func trap(_ height: [Int]) -> Int {
        var maxLeft = Array(repeating: 0, count: height.count)
        var maxRight = Array(repeating: 0, count: height.count)

        for i in 1..<height.count {
            maxLeft[i] = max(maxLeft[i-1], height[i-1])
        }

        for i in stride(from: height.count - 2, through: 0, by: -1) {
            maxRight[i] = max(maxRight[i+1], height[i+1])
        }
        
        var result = 0 
        for i in 0..<height.count {
            result += max(0, min(maxLeft[i], maxRight[i]) - height[i])
        }

        return result
    }
}
