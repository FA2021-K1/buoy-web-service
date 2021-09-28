import Apodini


protocol SensorHandler: Handler {
    static var dirPath: String { get }
    static var sensorType: SensorType { get }
    static var converter: MeasurementConverter { get }

    func handle() -> [SensorDump]
}

extension SensorHandler {
    func handle() -> [SensorDump] {
        readJSONDirectory(SensorDump.self, dirPath: Self.dirPath)
            .map { $0.filteredBySensorType(Self.sensorType).convertMeasurements(Self.converter) }
            .filter { !$0.measurements.isEmpty }
    }
}
