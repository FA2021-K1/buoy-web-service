import Apodini
import Foundation


struct Hello: Handler {

    func handle() -> [String:String] {
        let file = "/buoy/hello.json"
        let fileData: String
        var result: [String: String] = [:]

        //check if file is valid
        do {
            fileData = try String(contentsOfFile: file, encoding: .utf8);
        } catch {
            fileData = "Error"
        }
        
        if fileData == "Error" {
            result["Error"] = "Invalid File"
        }

        //Proceed with the dictionary conversion
        else {
            result = convertStringToDictionary(text: fileData)
            //result["Error"] = "Invalid File"
        }

        return result

    }
}


func convertStringToDictionary(text: String) -> [String:String] {
    var result: [String:String] = [:] 
    if let data = text.data(using: .utf8) {
         
        do {
            result = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as! [String:String]
        } catch {
            result["Error"] = "Invalid JSON"
        }
    }

    return result
}