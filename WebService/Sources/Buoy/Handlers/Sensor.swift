import Apodini
import Foundation


struct Sensor: Handler {
    func handle() -> [SensorDescription] {
        readJSONFromFile([SensorType].self, filePath: "available_sensors.json")?.map { SensorDescription(type: $0) } ?? []
    }
}
