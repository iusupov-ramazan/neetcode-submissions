import HeapModule 

class Solution {
    func isNStraightHand(_ hand: [Int], _ groupSize: Int) -> Bool {
        guard hand.count % groupSize == 0 else { return false }
        var dict: [Int: Int] = [:]
        for i in hand { dict[i, default: 0] += 1 }
        
        let sortedHand = hand.sorted()

        for num in sortedHand {
            if let freq = dict[num], freq > 0 {
                for i in num..<(num + groupSize) {
                    if let f = dict[i], f > 0 {
                        dict[i] = f - 1
                    } else {
                        return false
                    }
                }
            }
        }

        return true
    }
}