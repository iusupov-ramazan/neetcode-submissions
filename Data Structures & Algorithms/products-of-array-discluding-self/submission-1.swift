class Solution {
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        var prefix: [Int] = [1]
        var suffix: [Int] = [1]
        var prefixSum = 1
        var suffixSum = 1

        for i in 1..<nums.count {
            let num = nums[i - 1] * prefixSum
            prefix.append(num)
            prefixSum = num
            print(prefixSum)
        }

        for i in stride(from: nums.count - 2, through: 0, by: -1) {
            let num = nums[i + 1] * suffixSum
            suffix.insert(num, at: 0)
            suffixSum = num
            print(suffixSum)
        }
        return zip(prefix, suffix).map { $0 * $1 }
    }
}
