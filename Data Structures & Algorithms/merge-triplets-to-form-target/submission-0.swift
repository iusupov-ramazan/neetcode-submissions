class Solution {
    func mergeTriplets(_ triplets: [[Int]], _ target: [Int]) -> Bool {
        var res = Array(repeating: 0, count: target.count)
        for triplet in triplets {
            var isValid = true
            for i in 0..<triplet.count {
                if triplet[i] > target[i] {
                    isValid = false
                    break
                }
            }

            if isValid {
                for i in 0..<triplet.count {
                    res[i] = max(triplet[i], res[i])
                }
            }
        }
        return res == target
    }
}
