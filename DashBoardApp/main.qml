import QtQuick 2.12
import QtQuick.Window 2.12
import QtQml 2.12
import QtQuick.Controls 2.12


Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")
    color: "black"

    Rectangle {
            id: startButton
            width: 200
            height: 200
            radius: width / 2
            color: "red"
            anchors.centerIn: parent
            border.width: 5
            border.color: "white"

            Column{
                anchors.centerIn: parent

            Text {
                text: "START"
                font.pointSize: 40
                font.bold: true
                color: "white"

            }
            Text {
                x:50
                text: "power"
                font.pointSize: 20
                color: "white"
            }
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                                carDashboardLoader.source = "CarDashBoard.qml"
                                carDashboardLoader.item.visible = true
                              // hide()
                            }
            }
        }
    Loader {
           id: carDashboardLoader
           source: ""
           visible: false
       }

    Row{
        id:row
        y:350
        x:230
        spacing: 50
        Rectangle{
            id:r1
            width: 70
            height: 70

            Image {
                id: img1
                source: "qrc:/images/OpenLock.png"
                anchors.fill: parent
            }
        }
        Rectangle{
            id:r2
            width: 70
            height: 70
            color: "white"
            Image {
                id: img2
                source: "qrc:/images/OpenLock.png"
                anchors.fill: parent
            }
        }
    }
}
