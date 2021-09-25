import Apodini
import Foundation


struct ConductivitySensor: Handler {
    static let dirPath = "data"
    static let sensorType: SensorType = .CONDUCTIVITY
    static let converter = getMeasurementConverterInstance(sensorType: Self.sensorType)

    func handle() -> [SensorDump] {
        readJSONDirectory(SensorDump.self, dirPath: Self.dirPath)
            .map { $0.filteredBySensorType(Self.sensorType).convertMeasurements(Self.converter) }
            .filter { !$0.measurements.isEmpty }
    }
}
