import Apodini
import Foundation


struct ConductivitySensor: SensorHandler {
    static let dirPath = "data"
    static let sensorType: SensorType = .CONDUCTIVITY
    static let converter = getMeasurementConverterInstance(sensorType: .CONDUCTIVITY)
}
