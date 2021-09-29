import Apodini
import Foundation


struct PhSensor: Component {
    static let sensorType: SensorType = .POTENTIAHYDROGENII
    
    var content: some Component {
        Group("calibration") {
            PhSensorCalibration()
                .operation(.update)
        }

        PhSensorData()
    }
}

struct PhSensorCalibration: PolynomialSensorCalibrationHandler {
    static let filePath = "sensorconfig/PhSensor.json"
    static let sensorType: SensorType = PhSensor.sensorType

    @Parameter(.http(.body))
    var coeffs: [Double]

    @Throws(.serverError, reason: "Calibration couldn't be saved correctly")
    var serverError: ApodiniError
}

struct PhSensorData: SensorDataHandler {
    static let dirPath = "data"
    static let sensorType: SensorType = PhSensor.sensorType
    static let converter = getMeasurementConverterInstance(sensorType: PhSensor.sensorType)
}
