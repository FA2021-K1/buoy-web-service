import Apodini
import ApodiniOpenAPI
import ApodiniREST
import ArgumentParser


@main
struct DemoWebService: WebService {
    @Option(help: "The port the web service is offered at")
    var port: Int = 80


    var configuration: Configuration {
        HTTP2Configuration(cert: "/buoy/cert.pem", keyPath: "/buoy/key.pem")
        REST {
            OpenAPI()
        }
    }

    var content: some Component {
        Group("sensors") {
            Sensor()
        }
    }
}
