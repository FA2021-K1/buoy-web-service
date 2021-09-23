import Apodini
import Foundation

struct MeasurementItem: Content, Decodable {
    var sensorID: Int
    var sensorType: Int
    var measurement: Double
}

struct SensorDump: Content, Decodable {
    var buoyId: Int
    var date: String
    var location: Location
    var measurements: [MeasurementItem]
}

struct Location: Content, Decodable {
    var latitude: Double
    var longitude: Double
}

struct SensorData: Handler {
    func handle() -> [SensorDump] {
        let dirPath = "/buoy/data"
        guard let files = try? FileManager.default.contentsOfDirectory(atPath: dirPath) else {
            return []
        }
        return files.compactMap {fileName in
            guard let data = try? Data(contentsOf: URL(fileURLWithPath: dirPath + "/" + fileName)) else {
                return nil
            }
            return try? JSONDecoder().decode(SensorDump.self, from: data)
        }
    }
}
