import Apodini
import Foundation


struct Sensor: Handler {
    func handle() -> [Int] {
        guard let data = try? Data(contentsOf: URL(fileURLWithPath: "/buoy/available_sensors.json")) else {
            return []
        }
        return (try? JSONDecoder().decode([Int].self, from: data)) ?? []
    }
}
