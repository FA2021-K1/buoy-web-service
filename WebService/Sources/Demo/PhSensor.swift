import Apodini
import Foundation


struct PhSensor: SensorHandler {
    static let dirPath = "data"
    static let sensorType: SensorType = .POTENTIAHYDROGENII
    static let converter = getMeasurementConverterInstance(sensorType: .POTENTIAHYDROGENII)
}
