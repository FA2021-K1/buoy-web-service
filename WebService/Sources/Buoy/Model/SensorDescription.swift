import Apodini

struct SensorDescription: Content {
    let name: String
    let type: SensorType

    init(type: SensorType) {
        self.type = type
        self.name = type.description
    }
}
