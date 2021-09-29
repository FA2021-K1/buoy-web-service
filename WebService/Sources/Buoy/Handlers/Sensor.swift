import Apodini
import Foundation


struct Sensor: Handler {
    func handle() -> [SensorDescription] {
        readJSONFromFile([SensorType].self, filePath: "available_sensors.json")?.map { SensorDescription(type: $0) } ?? []
    }

    var content: some Component {
        Group("all") {
            SensorData()
        }

        Group(TemperatureSensor.sensorType.description) {
            TemperatureSensor()
        }

        Group(ConductivitySensor.sensorType.description) {
            ConductivitySensor()
        }

        Group(PhSensor.sensorType.description) {
            PhSensor()
        }
    }
}
