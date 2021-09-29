import Apodini


protocol SensorDataHandler: Handler {
    static var dirPath: String { get }
    static var sensorType: SensorType { get }
    static var converter: MeasurementConverter { get }

    func handle() -> [SensorDump]
}

extension SensorDataHandler {
    func handle() -> [SensorDump] {
        readJSONDirectory(SensorDump.self, dirPath: Self.dirPath)
            .map { $0.filteredBySensorType(Self.sensorType).convertMeasurements(Self.converter) }
            .filter { !$0.measurements.isEmpty }
    }
}

protocol SensorCalibrationHandler: Handler {
    static var filePath: String { get }
    static var sensorType: SensorType { get }
}
