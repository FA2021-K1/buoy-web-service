import Apodini
import ApodiniOpenAPI
import ApodiniREST
import ArgumentParser


@main
struct DemoWebService: WebService {
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
