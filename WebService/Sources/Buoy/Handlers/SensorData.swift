import Apodini
import BuoyDeploymentOption
import Foundation


struct SensorData: Handler {
    static let dirPath = "data"

    func handle() -> [SensorDump] {
        readJSONDirectory(SensorDump.self, dirPath: Self.dirPath)
            .map {
                SensorDump(
                    buoyId: $0.buoyId,
                    date: $0.date,
                    location: $0.location,
                    measurements: $0.measurements.map { item in
                        MeasurementItem(
                            sensorID: item.sensorID,
                            sensorType: item.sensorType,
                            measurement: getMeasurementConverterInstance(sensorType: item.sensorType).convert(rawValue: item.measurement))
                    }
                )
            }
    }

    var content: some Component {
        Group(TemperatureSensor.sensorType.description) {
            TemperatureSensor()
                .metadata(
                    DeploymentDevice(.temperature)
                )
        }

        Group(ConductivitySensor.sensorType.description) {
            ConductivitySensor()
                .metadata(
                    DeploymentDevice(.conductivity)
                )
        }

        Group(PhSensor.sensorType.description) {
            PhSensor()
                .metadata(
                    DeploymentDevice(.ph)
                )
        }
    }
}
