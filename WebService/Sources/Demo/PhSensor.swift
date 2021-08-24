import Apodini
import Foundation


struct PhSensor: Handler {
    @Parameter var offset: Int = 0
    
    
    func handle() -> [String] {
        let path = FileManager.default.currentDirectoryPath.appendingPathComponent("ph_values.txt")
        do {
            let data = try String(contentsOfFile: path, encoding: .utf8)
            let lines = data.components(separatedBy: .newlines)
            return Array(lines[offset...])
        } catch {
            print("Error reading file")
            return []
        }
    }
}
