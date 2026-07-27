class Solution {
    func carFleet(_ target: Int, _ position: [Int], _ speed: [Int]) -> Int {
        guard position.count == speed.count else { return .zero }
        var fleets = Array(repeating: Double.zero, count: target)
        var answer = 0
        var maxTime = Double.zero
        for i in 0..<position.count {
            let time = Double((target - position[i])) / Double(speed[i])
            fleets[position[i]] = time
        }
        print(fleets)
        for i in stride(from: fleets.count - 1, through: 0, by: -1) where fleets[i] > 0.0 {
            if fleets[i] > maxTime {
                maxTime = fleets[i]
                answer += 1
            }
        }
        return answer
    }
}
