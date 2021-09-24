import Foundation

let mountDir = "/buoy"

func readJSONFromFile<T>(_ type: T.Type, filePath: String) -> T? where T: Decodable {
    guard let data = try? Data(contentsOf: URL(fileURLWithPath: mountDir + "/" + filePath)) else {
        return nil
    }
    return try? JSONDecoder().decode(T.self, from: data)
}
