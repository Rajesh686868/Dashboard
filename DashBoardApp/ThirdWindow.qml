import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQml 2.12
import QtMultimedia 5.12

Window {
    id:root2
    width: 600
    height: 500
    visible: true
    title: "ThirdWindow"
    color: "white"
    signal colorChanged(string color)
    signal colorChanged2(string color)

Rectangle{
    id:rec1
    x:250
    y:0
    width: 100
    height: 100
   color: "white"

    Image {
        id: img1
        source: "qrc:/ThirdWindow/Horn.png"
        anchors.centerIn: parent
        anchors.fill: parent
    }
    MouseArea{
        anchors.fill: parent
        onClicked: {
            console.log("pom pom")
            clickSound.play()
        }
    }
    Audio {
        id: clickSound
        source:"qrc:/ThirdWindow/mixkit-car-double-horn-719.wav"
    }

}

Rectangle{
    id:rec10
    x:250
    y:360
    width: 100
    height: 100
    color: "white"

    Image {
        id: img10
        source: "qrc:/ThirdWindow/Car-removebg-preview.png"
        anchors.centerIn: parent
        anchors.fill: parent
    }
}

Row{
    id:row1
    x:0
    y:120
    spacing: 50

    Rectangle{
        id:rec2
        width: 100
        height: 100
        color: "white"

        Image {
            id: img2
            source: "qrc:/ThirdWindow/big-left-arrow-icon.png"
            anchors.centerIn: parent
            anchors.fill: parent
             }
        MouseArea{
            anchors.fill: parent

            onClicked: {
              //  console.log(rec2.color)
                if(rec2.color=="#ffffff"){
                    rec2.color="green"
                    colorChanged("green")
                }
                else if(rec2.color=="#008000"){
                    rec2.color="white"
                    colorChanged("white")
                }
            }
        }
    }

    Rectangle{
        id:rec3
        width: 100
        height: 100
        color: "white"

        Image {
            id: img3
            source: "qrc:/ThirdWindow/big-right-arrow-icon.png"
            anchors.centerIn: parent
            anchors.fill: parent
        }
       MouseArea{
           anchors.fill: parent
           onClicked: {
             //  console.log(rec2.color)
               if(rec3.color=="#ffffff"){
                   rec3.color="green"
                   colorChanged2("green")
               }
               else if(rec3.color=="#008000"){
                   rec3.color="white"
                   colorChanged2("white")
               }
           }
       }
    }
    Rectangle{
        id:rec4
        width: 100
        height: 100
        color: "white"

        Image {
            id: img4
            source: "qrc:/ThirdWindow/Radio-removebg-preview.png"
            anchors.centerIn: parent
            anchors.fill: parent
        }
    }
    Rectangle{
        id:rec5
        width: 100
        height: 100
        color: "white"

        Image {
            id: img5
            source: "qrc:/ThirdWindow/Bluetooth-removebg-preview.png"
            anchors.centerIn: parent
            anchors.fill: parent
        }
    }
}
Row{
    id:row2
    x:0
    y:240
    spacing: 50

    Rectangle{
        id:rec6
        width: 100
        height: 100
        color: "white"

        Image {
            id: img6
            source: "qrc:/ThirdWindow/Phone-removebg-preview.png"
            anchors.centerIn: parent
            anchors.fill: parent
        }
    }
    Rectangle{
        id:rec7
        width: 100
        height: 100
        color: "white"

        Image {
            id: img7
            source: "qrc:/ThirdWindow/Music.png"
            anchors.centerIn: parent
            anchors.fill: parent
        }
    }
    Rectangle{
        id:rec8
        width: 100
        height: 100
        color: "white"

        Image {
            id: img8
            source: "qrc:/ThirdWindow/Setting-removebg-preview.png"
            anchors.centerIn: parent
            anchors.fill: parent
        }

        MouseArea{
            anchors.fill: parent

            onClicked: {
                userdisplay.source="UserDisplay.qml"
                userdisplay.item.visible=true
            }
        }
       Loader{
           id:userdisplay
           source: ""
           visible: false
       }
    }
    Rectangle{
        id:rec9
        width: 100
        height: 100
        color: "white"

        Image {
            id: img9
            source: "qrc:/ThirdWindow/Navigation-removebg-preview.png"
            anchors.centerIn: parent
            anchors.fill: parent
        }
    }
}
}
