import Foundation

protocol UserDefaultsManagerProtocol {
    func save<T: Encodable>(_ object: T, forKey key: String)
    func load<T: Decodable>(_ type: T.Type, forKey key: String) -> T?
    func remove(forKey key: String)
}

class UserDefaultsManager: UserDefaultsManagerProtocol {

    func save<T: Encodable>(_ object: T, forKey key: String) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(object) {
            UserDefaults.standard.set(encoded, forKey: key)
        }
    }

    func load<T: Decodable>(_ type: T.Type, forKey key: String) -> T? {
        if let savedData = UserDefaults.standard.object(forKey: key) as? Data {
            let decoder = JSONDecoder()
            if let loadedObject = try? decoder.decode(type, from: savedData) {
                return loadedObject
            }
        }
        return nil
    }

    func remove(forKey key: String) {
        UserDefaults.standard.removeObject(forKey: key)
    }
}
