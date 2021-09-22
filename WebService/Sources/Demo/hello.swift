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

struct Hello: Handler {
    func handle() -> SensorDump? {
        do {
            return try JSONDecoder().decode(SensorDump.self, from: try Data(contentsOf: URL(fileURLWithPath: "/buoy/test.json")))
        } catch {
            return nil
        }
    }
}
