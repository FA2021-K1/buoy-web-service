import Apodini
import Foundation

struct ConductivitySensor: Component {
    static let sensorType: SensorType = .CONDUCTIVITY
    
    var content: some Component {
        Group("calibration") {
            ConductivitySensorCalibration()
                .operation(.update)
        }

        ConductivitySensorData()
    }
}

struct ConductivitySensorCalibration: SensorCalibrationHandler {
    static let filePath = "sensorconfig/ConductivitySensor.json"
    static let sensorType: SensorType = ConductivitySensor.sensorType

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

struct ConductivitySensorData: SensorDataHandler {
    static let dirPath = "data"
    static let sensorType: SensorType = ConductivitySensor.sensorType
    static let converter = getMeasurementConverterInstance(sensorType: ConductivitySensor.sensorType)
}
