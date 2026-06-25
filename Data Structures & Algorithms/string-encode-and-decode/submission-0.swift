class Solution {

    func encode(_ strs: [String]) -> String {
        let encoder = JSONEncoder()
        return String(data: try! encoder.encode(strs), encoding: .utf8)!
    }

    func decode(_ str: String) -> [String] {
        let decoder = JSONDecoder()
        return try! decoder.decode([String].self, from: str.data(using: .utf8)!)
    }
}
