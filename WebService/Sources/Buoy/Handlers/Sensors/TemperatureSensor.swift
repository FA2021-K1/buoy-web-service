import Apodini
import Foundation


struct TemperatureSensor: SensorHandler {
    static let dirPath = "data"
    static let sensorType: SensorType = .TEMPERATURE
    static let converter = getMeasurementConverterInstance(sensorType: .TEMPERATURE)
}
