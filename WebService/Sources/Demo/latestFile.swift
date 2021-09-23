import Apodini
import Foundation


struct LatestFile: Handler {
    func handle() -> [SensorDump] {
        do {
            let dirPath = "/buoy/data"
            let files =  try FileManager.default.contentsOfDirectory(atPath: dirPath)
            return try files.map{ (fileName) in
                try JSONDecoder().decode(SensorDump.self, from: try Data(contentsOf: URL(fileURLWithPath: dirPath + "/" + fileName)))
            }
            
        } catch {
            return []
        }
    }
}