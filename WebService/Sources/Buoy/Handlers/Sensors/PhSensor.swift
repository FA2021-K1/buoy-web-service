import Apodini
import Foundation


struct PhSensor: Component {
    static let sensorType: SensorType = .POTENTIAHYDROGENII
    
    var content: some Component {
        Group("calibration") {
            PhSensorCalibration()
                .operation(.update)
        }

        Group("data") {
            PhSensorData()
        }
    }
}

struct PhSensorCalibration: SensorCalibrationHandler {
    static let filePath = "sensorconfig/PhSensor.json"
    static let sensorType: SensorType = PhSensor.sensorType

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

struct PhSensorData: SensorDataHandler {
    static let dirPath = "data"
    static let sensorType: SensorType = PhSensor.sensorType
    static let converter = getMeasurementConverterInstance(sensorType: PhSensor.sensorType)
}
