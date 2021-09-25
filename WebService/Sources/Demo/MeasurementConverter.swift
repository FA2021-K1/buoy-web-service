import Apodini


protocol MeasurementConverter {
    func convert(rawValue: Double) -> Double
}

func getMeasurementConverterInstance(sensorType: Int) -> MeasurementConverter {
    switch sensorType {
    case TDSSensor.sensorType:
        return PolynomialMeasurementConverter(configFilePath: "sensorconfig/TDSSensor.json")
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
