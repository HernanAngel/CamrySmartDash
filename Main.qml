import QtQuick
import QtQuick.Window
import QtQuick.Controls

Window{
  id: root
  width: 1100
  height: 650
  visible: true
  title: "Camry Smart Dash"
  color: "#080e19"

  property real rpm: 850
  property real speed: 0
  property real coolant: 89
  property bool simulation: true

  Timer {
      interval: 80
      running: root.simulation
      repeat: true
      onTriggered: {
          let t = Date.now() / 1000
          root.rpm = 2600 + 1700 * Math.sin(t * 0.8)
          root.speed = 45 + 25 * Math.sin(t * 0.35)
          root.coolant = 80 + 3 * Math.sin(t * 0.15)
      }
  }

  Text {
                       text: "CAMRY // SMART DASH"
                       color: "#00dcff"
                       font.pixelSize: 27
                       font.bold: true
                       anchors.top: parent.top
                       anchors.left: parent.left
                       anchors.margins: 35
  }

  Text {
                       text: "2017 SE  |  SYSTEM ONLINE  |  DEMO"
                       color: "#8095aa"
                       font.pixelSize: 14
                       anchors.top: parent.top
                       anchors.right: parent.right
                       anchors.margins: 40
  }

  Text {
                       text: "CAMRY OS - BUILD 001"
                       color: "#8095aa"
                       font.pixelSize: 20
                       anchors.top: parent.top
                       anchors.horizontalCenter: parent.horizontalCenter
                       anchors.margins: 40
  }


    Row{
        id: dashboardRow
        anchors.centerIn: parent
        spacing: 35

        Rectangle {
            width: 310
            height: 360
            radius: 20
            color: "#101b2b"
            border.color: "#164b65"

            Column {
                anchors.centerIn: parent
                spacing: 15

                Text {
                    text: "Engine RPM"
                    color: "#00dcff"
                    font.pixelSize: 19
                    anchors.horizontalCenter: parent.horizontalCenter
                }
                Text {
                    text: Math.round(root.rpm).toString()
                    color:"white"
                    font.pixelSize: 56
                    font.bold: true
                    anchors.horizontalCenter: parent.horizontalCenter
                }

                Rectangle{
                    width: 245
                    height: 12
                    radius: 6
                    color: "#263849"

                    Rectangle{
                        width: parent.width * Math.min(root.rpm / 6500, 1)
                        height: parent.height
                        radius: 6
                        color: root.rpm > 5500 ? "#ff5252" : "#00dcff"

                        Behavior on width {
                            NumberAnimation { duration: 100}
                        }
                    }
                }
            }
        }

        Rectangle {
                   width: 310
                   height: 360
                   radius: 20
                   color: "#101b2b"
                   border.color: "#164b65"

                   Column {
                       anchors.centerIn: parent
                       spacing: 35

                       Text {
                           text: "VEHICLE SPEED"
                           color: "#00dcff"
                           font.pixelSize: 19
                           anchors.horizontalCenter: parent.horizontalCenter
                       }

                       Text {
                           text: Math.round(root.speed).toString()
                           color: "white"
                           font.pixelSize: 80
                           font.bold: true
                           anchors.horizontalCenter: parent.horizontalCenter
                       }

                       Text {
                           text: "MPH"
                           color: "#8095aa"
                           font.pixelSize: 18
                           anchors.horizontalCenter: parent.horizontalCenter
                       }
                   }
               }

               Rectangle {
                   width: 310
                   height: 360
                   radius: 20
                   color: "#101b2b"
                   border.color: "#164b65"

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
                           text: root.coolant.toFixed(1) + " °C"
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
    }

    Button{
                       id: simulationButton
                       anchors.top: dashboardRow.bottom
                       anchors.horizontalCenter: parent.horizontalCenter
                       anchors.topMargin: 20
                       onClicked: {
                                              root.simulation= !root.simulation
                       }
                       text: root.simulation ? "Stop Simulation" : "Resume Simulation"

                       background: Rectangle {
                                              radius: 10
                                              color: simulationButton.hovered ? "#142b3a" : "#101b2b"
                                              border.color: simulationButton.hovered ? "#45c8df" : "#164b65"
                                              border.width: 1

                                              Behavior on color{

                                                                     ColorAnimation {
                                                                                            duration: 200
                                                                     }
                                              }
                       }

                       contentItem: Text{
                                              text: simulationButton.text
                                              color: "#00dcff"
                                              font.pixelSize: 16
                                              horizontalAlignment: Text.AlignHCenter
                                              verticalAlignment: Text.AlignVCenter
                       }
    }



    Text {
        text: "CAMRY PROJECT  //  PROTOTYPE V0.1"
        color: "#547188"
        font.pixelSize: 13
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottomMargin: 25
    }
}