import Apodini


protocol MeasurementConverter {
    func convert(rawValue: Double) -> Double
}

func getMeasurementConverterInstance(sensorType: SensorType) -> MeasurementConverter {
    switch sensorType {
    case TemperatureSensor.sensorType:
        return PolynomialMeasurementConverter(configFilePath: "sensorconfig/TemperatureSensor.json")
    case ConductivitySensor.sensorType:
        return PolynomialMeasurementConverter(configFilePath: "sensorconfig/ConductivitySensor.json")
    case PhSensor.sensorType:
        return PolynomialMeasurementConverter(configFilePath: "sensorconfig/PhSensor.json")
    default:
        return NoopConverter()
    }
}

struct NoopConverter: MeasurementConverter {
    func convert(rawValue: Double) -> Double {
        rawValue
    }
}

struct PolynomialMeasurementConverter: MeasurementConverter {
    var polynomialCoefficients: [Double]

    
    init(configFilePath: String) {
        self.polynomialCoefficients = readJSONFromFile([Double].self, filePath: configFilePath) ?? []
    }

    func convert(rawValue: Double) -> Double {
        polynomialCoefficients.reduce(0) {result, coeff in
            result * rawValue + coeff
        }
    }
}
