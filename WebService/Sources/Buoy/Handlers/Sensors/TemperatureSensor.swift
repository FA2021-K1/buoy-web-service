import Apodini
import Foundation


struct TemperatureSensor: Component {
    static let sensorType: SensorType = .TEMPERATURE
    
    var content: some Component {
        Group("calibration") {
            TemperatureSensorCalibration()
                .operation(.update)
        }

        TemperatureSensorData()
    }
}

struct TemperatureSensorCalibration: SensorCalibrationHandler {
    static let filePath = "sensorconfig/TemperatureSensor.json"
    static let sensorType: SensorType = TemperatureSensor.sensorType

    @Parameter(.http(.body))
    var coeffs: [Double]

    @Throws(.serverError, reason: "Calibration couldn't be saved correctly")
    var serverError: ApodiniError

    func handle() throws -> [Double] {
        do {
            try writeJSONToFile([Double].self, filePath: Self.filePath, content: coeffs)
            return coeffs
        } catch {
            throw serverError
        }
    }
}

struct TemperatureSensorData: SensorDataHandler {
    static let dirPath = "data"
    static let sensorType: SensorType = TemperatureSensor.sensorType
    static let converter = getMeasurementConverterInstance(sensorType: TemperatureSensor.sensorType)
}
