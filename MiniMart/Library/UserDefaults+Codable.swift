import Foundation

extension UserDefaults {
    func setEncodableValue<T: Encodable>(_ value: T, forKey key: String) throws {
        let data = try JSONEncoder().encode(value)
        set(data, forKey: key)
    }

    func decodableValue<T: Decodable>(forKey key: String) throws -> T? {
        try data(forKey: key).map { try JSONDecoder().decode(T.self, from: $0) }
    }
}
