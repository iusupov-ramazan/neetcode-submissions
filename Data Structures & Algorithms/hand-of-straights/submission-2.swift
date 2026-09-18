class Solution {
    func isNStraightHand(_ hand: [Int], _ groupSize: Int) -> Bool {
        var dict: [Int: Int] = [:]
        for i in hand { dict[i, default: 0] += 1 }

        let list = hand.sorted()
        for num in list {
            if let freq = dict[num], freq > 0 {
                for j in num..<(groupSize + num) {
                    if let v = dict[j], v > 0 {
                        dict[j] = v - 1    
                    } else {
                        return false
                    }
                }
            }
        }
        return true
    }
}
