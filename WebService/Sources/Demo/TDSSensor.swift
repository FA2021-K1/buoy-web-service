import Apodini
import Foundation


struct TDSSensor: Handler {
    static let dirPath = "data"
    static let sensorType: Int = 1

    func handle() -> [SensorDump] {
        readJSONDirectory(SensorDump.self, dirPath: Self.dirPath)
            .map { $0.filteredBySensorType(Self.sensorType) }
            .filter { !$0.measurements.isEmpty }
    }
}
