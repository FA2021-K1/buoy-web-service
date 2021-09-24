import Apodini
import Foundation


struct SensorData: Handler {
    static let dirPath = "data"

    func handle() -> [SensorDump] {
        guard let files = try? FileManager.default.contentsOfDirectory(atPath: mountDir + "/" + SensorData.dirPath) else {
            return []
        }
        return files.compactMap {fileName in
            return readJSONFromFile(SensorDump.self, filePath: SensorData.dirPath + "/" + fileName)
        }
    }
}
