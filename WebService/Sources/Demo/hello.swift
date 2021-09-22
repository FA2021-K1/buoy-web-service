import Apodini
import Foundation

struct mItems: Content, Decodable {
    var sensorID: Int
    var sensorType: Int
    var measurement: Double
}

struct JSONStructure: Content, Decodable {
    var buoyId: Int
    var date: String
    var location: Location
    var measurements: [mItems]
}

struct Location: Content, Decodable {
    var latitude: Double
    var longitude: Double
}

struct Hello: Handler {

    func handle() -> JSONStructure {
        
        // Do it like this 
        let contents = try! JSONDecoder().decode(JSONStructure.self, from: try! Data(contentsOf: URL(fileURLWithPath: "/buoy/test.json")))
        
        return contents

    }
}


/*func convertStringToDictionary(text: String) -> [String:String] {
    
    var result: [String:String] = [:] 
    if let data = text.data(using: .utf8) {
         
        do {
            result = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as! [String:String]
        } catch {
            result["Error"] = "Invalid JSON"
        }
    }

    return result
}*/