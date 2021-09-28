import Apodini
import ApodiniHTTP
import ArgumentParser


@main
struct BuoyWebService: WebService {
    @Option(help: "The port the web service is offered at")
    var port: Int = 80

    var configuration: Configuration {
        HTTPConfiguration(port: port)
        HTTP()
    }

    var content: some Component {
        Group("sensors") {
            Sensor()
        }

        Group("data") {
            SensorData()
        }
    }
}
