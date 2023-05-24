import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQml 2.12
import QtMultimedia 5.12
import QtQuick.Layouts 1.12

Window {
    id:root2
    width: 600
    height: 500
    visible: true
    title: "UserDisplayWindow"
    color: "white"

    Image {
        id:img1
        source: "qrc:/ThirdWindow/Car.jpg"
        anchors.centerIn: parent
        anchors.fill: parent

    }


    Rectangle{
        id:rect1
        x:50
        y:350
        width: 150
        height: 150
        radius: height/2
        color: "red"
        border.width: 5
        border.color: "white"

        Text {
            id: txt1
            text: qsTr("USER")
            anchors.centerIn: parent
            font.pointSize: 25
            font.bold: true
            color: "white"
        }
        MouseArea{
            anchors.fill: parent
            onClicked: {
             popup1.open()
            }
        }
    }

    Popup {
        id: popup1
        x: 160
        y: 200
        width: 300
        height: 150
        modal: true
        contentItem: Rectangle {
            width: parent.width
            height: parent.height
            color: "white"

            RowLayout {
                anchors.fill: parent
                spacing: 10

                Rectangle {
                    id: rectUser
                    width: 100
                    height: 50
                    color: "lightblue"
                    border.width: 2
                    border.color: "black"
                    radius: 5

                    Text {
                        text: "User"
                        anchors.centerIn: parent
                    }
                }

                Rectangle {
                    id: rectAddUser
                    width: 100
                    height: 50
                    color: "lightgreen"
                    border.width: 2
                    border.color: "black"
                    radius: 5

                    Text {
                        text: "Add User"
                        anchors.centerIn: parent
                    }
                    MouseArea{
                        anchors.fill: parent

                        onClicked: {
                            popup2.open()
                        }
                    }
                }
            }
        }
        closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutside
    }

    Popup{
        id:popup2
        x: 160
        y: 200
        width: 300
        height: 275
        modal: true

        contentItem: Rectangle {
                width: parent.width
                height: parent.height
                color: "white"

                Text {
                    x:0
                    y:10
                    id: txt
                    text: qsTr("Name")
                    font.bold:true
                }
                TextField{
                    id:txtfield
                    x:50
                    y:0
                    placeholderText: "Enter Name:"
                }
                Column{
                    x:50
                    y:60
                    spacing: 10

                    ComboBox{
                      id:combobox1
                      width: 150
                      height: 40
                      model: ["choose color","red","green","blue","yellow","pink"]
                    }
                    ComboBox{
                        id:combobox2
                        width: 150
                        height: 40
                        model: ["choose wallpaper","red","green","blue","yellow","pink"]
                    }
                    ComboBox{
                        id:combobox3
                        width: 150
                        height: 40
                        model: ["choose needle","1","2","3","4","5"]
                    }
                }

                Row{
                    y:210
                    x:20
                    spacing: 90

                    Button{
                        id:btn1
                        width: 80
                        height: 40
                        text: "Save"

                        onClicked: {
                            database.addingData(txtfield.text,combobox1.currentText,combobox2.currentText,combobox3.currentText)
                        }
                    }
                    Button{
                        id:btn2
                        width: 80
                        height: 40
                        text: "Choose"
                    }
                }
        }
        closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutside
    }

    Rectangle{
        id:rect2
        x:350
        y:350
        width: 150
        height: 150
        radius: height/2
        color: "Yellow"
        border.width: 5
        border.color: "white"

        Text {
            id: txt2
            text: qsTr("BACK")
            anchors.centerIn: parent
            font.pointSize: 25
            font.bold: true
            color: "white"
        }

    }
}
