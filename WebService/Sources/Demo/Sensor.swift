import Apodini
import Foundation


struct Sensor: Handler {
    func handle() -> [Int] {
        readJSONFromFile([Int].self, filePath: "available_sensors.json") ?? []
    }
}
