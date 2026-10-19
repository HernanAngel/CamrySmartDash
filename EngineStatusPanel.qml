import QtQuick

Rectangle{
    id: panel

    width: 310
    height: 360
    radius: 20
    color: "#101b2b"
    border.color: "#164b65"
    property real coolantTemperature: 0

    Column {
        anchors.centerIn: parent
        spacing: 20

        Text {
            text: "ENGINE STATUS"
            color: "#00dcff"
            font.pixelSize: 19
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Text {
            text: panel.coolantTemperature.toFixed(1) + " °C"
            color: "white"
            font.pixelSize: 39
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Text {
            text: "Coolant Temperature"
            color: "#8095aa"
            font.pixelSize: 16
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Text {
            text: "SIMULATED DATA"
            color: "#ffcc66"
            font.pixelSize: 15
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }
}
