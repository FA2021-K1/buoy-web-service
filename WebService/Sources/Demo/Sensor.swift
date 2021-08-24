import Apodini


struct Sensor: Handler {
    func handle() -> String {
        """
        List of sensors:
        pH
        """
    }

    var content: some Component {
        Group("ph") {
            PhSensor()
        }
    }
}
