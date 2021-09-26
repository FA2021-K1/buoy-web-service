import Apodini
import Foundation


struct Sensor: Handler {
    func handle() -> [SensorDescription] {
        readJSONFromFile([SensorType].self, filePath: "available_sensors.json")?.map { SensorDescription(type: $0) } ?? []
    }
}

struct SensorDescription: Content {
    let name: String
    let type: SensorType

    init(type: SensorType) {
        self.type = type
        self.name = type.description
    }
}
