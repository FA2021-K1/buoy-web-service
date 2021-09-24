import Apodini

struct SensorDump: Content, Decodable {
    var buoyId: Int
    var date: String
    var location: Location
    var measurements: [MeasurementItem]

    func filteredBySensorType(_ sensorType: Int) -> SensorDump {
        SensorDump(
            buoyId: self.buoyId,
            date: self.date,
            location: self.location,
            measurements: self.measurements.filter { $0.sensorType == sensorType }
        )
    }
}

struct Location: Content, Decodable {
    var latitude: Double
    var longitude: Double
}

struct MeasurementItem: Content, Decodable {
    var sensorID: Int
    var sensorType: Int
    var measurement: Double
}
