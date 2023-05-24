import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQml 2.12

Window {
    id:root
    width: 600
    height: 600
    visible: true
    title: "Speedometer"
    color: "grey"

    property int temp1: 0
    property int engineRPM1: 0
    property int speed1: 0
    property int level1: 0

Connections{
    target: Dash

    onNotifyOutsideTemp:{
        temp1=temp
       // console.log(temp1)

    }
}
Connections{
    target: Dash

    onNotifyEngineRPM:{
        engineRPM1=engRPM
      //  console.log(engineRPM1)

    }
}
Connections{
    target: Dash

    onNotifyVehicleSpeed:{
        speed1=speed
      //  console.log(speed)
    }
}
Connections{
    target: Dash

    onNotifyFuelLevel:{
        level1=level
       // console.log(level)
    }
}

Connections{
    target: thirdwindow.item

   onColorChanged:{
       console.log(color)
       rec1.color=color
   }
}
Connections{
    target: thirdwindow.item
   onColorChanged2:{
       console.log(color)
       rec3.color=color
   }
}

    Rectangle{
        id:rect1
        x:0
        y:300
        width: 150
        height: 150
        color: "grey"
        Image {
            id: tempImage
            source: "qrc:/images/Temprature_Icon-removebg-preview.png"
            anchors.fill: parent
          }
    }
    Item {
            id: needleContainer1
           property real scaleFactor: 1.0
            Image {
                id: needleimage1
                source: "qrc:/images/Left_Needle.png"
                x:39
                y:343
                width: 75
                height: 75
                rotation: temp1 * needleContainer1.scaleFactor
            }
    }

    Rectangle{
        id:rect2
        x:150
        y:300
        width: 150
        height: 150
        color: "grey"

        Image {
            id: rpmImage
            source: "qrc:/images/RPM_Icon-removebg-preview.png"
            anchors.fill: parent
               }
    }
    Item{
        id:needleContainer2
        property real scaleFactor: 1.0
            Image {
                id: needleimage2
                source: "qrc:/images/Left_Needle.png"
                x:190
                y:343
                width: 75
                height: 75
                rotation: engineRPM1 *needleContainer2.scaleFactor
        }
}
    Rectangle{
        id:rect3
        x:300
        y:300
        width: 150
        height: 150
        color: "grey"

        Image {
            id: speedImage
            source: "qrc:/images/Speedometer_Icon-removebg-preview.png"
            anchors.fill: parent
         }
    }

    Item{
      id:needleContainer3
      property real scaleFactor: 1.0
    Image {
        id: needleimage3
        source: "qrc:/images/Left_Needle.png"
        x:340
        y:343
        width: 75
        height: 75
        rotation:speed1 * needleContainer3.scaleFactor
    }
}

    Rectangle{
        id:rect4
        x:450
        y:300
        width: 150
        height: 150
        color: "grey"

        Image {
            id: fuelImage
            source: "qrc:/images/Fuel_Icon-removebg-preview.png"
            anchors.fill: parent
         }
    }

    Item{
        id:needleContainer4
        property real scaleFactor: 1.0

    Image {
        id: needleimage4
        source: "qrc:/images/Right_Needle.png"
        x:490
        y:343
        width: 75
        height: 75
        rotation: level1*needleContainer4.scaleFactor
}
}

    Rectangle{
        x:500
        y:10
        height: 70
        width: 70
        radius: height/2
        color: "red"

        Text {
            id: txt
            text: qsTr("Stop")
            color: "black"
            font.pointSize: 15
            font.bold: true
            anchors.centerIn: parent
        }

        MouseArea{
            id:mousearea
            anchors.fill: parent
            onClicked: {
             Dash.stopTemprature();
             Dash.stopEngineRPM();
             Dash.stopVehicleSpeed();
             Dash.stopFuelLevel();
            timer2.stop()
                console.log("temp=",temp1)
                console.log("engineRPM=",engineRPM1)
                console.log('Spedd=',speed1)
                console.log("fuel level=",level1)

                console.log(label2.text)
                database.addingTiming(label2.text)

            }
        }
    }


    Row{
        id:row1
        x:200
        y:50
        spacing: 15

        Rectangle{
            id:rec1
             width: 60
             height: 60
             radius: height/2
             color: "white"

             Image {
                 id:img1
                 source: "qrc:/images/big-left-arrow-icon.png"
                  fillMode: Image.PreserveAspectFit
                 anchors.centerIn: rec1
                 width: rec1.width*0.8
                 height: rec1.height*0.8
             }

        }

        Rectangle{
            id:rec2
             width: 60
             height: 60
             radius: height/2
             color: "white"
             Image {
                 id:img2
                 source: "qrc:/images/Headlight.png"
                  fillMode: Image.PreserveAspectFit
                 anchors.centerIn: rec2
                 width: rec1.width*0.8
                 height: rec1.height*0.8
             }

        }
        Rectangle{
            id:rec3
             width: 60
             height: 60
             radius: height/2
             color: "white"

             Image {
                 id:img3
                 source: "qrc:/images/big-right-arrow-icon.png"
                  fillMode: Image.PreserveAspectFit
                 anchors.centerIn: rec3
                 width: rec1.width*0.8
                 height: rec1.height*0.8
             }
        }
    }

Label{
    id:lbl1
    text: "time"
    color: "white"
    x:250
    y:10
    font.pointSize: 25
    font.bold: true
}

  Timer{
      id:timer1
      interval: 500
      repeat: true
      running: true
      triggeredOnStart: true
      onTriggered: {
          lbl1.text= new Date().toLocaleTimeString(Qt.locale("en_US"),"hh:mm:ss ap")
      }
  }

  Label{
      id:label2
      text:"Engine:"
      x:330
      y:450
      font.pointSize: 10
      font.bold: true
      color: "white"
  }
  Timer{
      id:timer2
      interval: 500
      repeat: true
      running: true
      triggeredOnStart: true
      property int time: 0

      onTriggered: {
          time+=interval
          var seconds=Math.floor(time/1000)
          var minutes=Math.floor(seconds/60)
          var hours=Math.floor(minutes/60)

          seconds=seconds%60
          minutes=minutes%60
          label2.text="Engine:"+hours+"h"+minutes+"m"+seconds+"s"
      }

  }

  Rectangle{
      id:rec4
      x:275
      y:125
      width: 60
      height: 60
      radius: height/2
      color: "white"

      Image {
          id: img4
          source: "qrc:/images/Battery-removebg-preview.png"
          anchors.centerIn: rec4
          width: rec4.width*0.8
          height: rec4.width*0.8
      }
  }

  Rectangle{
      id:rec5
      x:275
      y:200
      width: 60
      height: 60
      radius: height/2
      color: "white"

      Image {
          id: img5
          source: "qrc:/images/Green_Headlight-removebg-preview.png"
          anchors.centerIn: rec5
          width: rec5.width*0.8
          height: rec5.height*0.8
      }
  }

  Rectangle{
      id:rec6
      x:275
      y:450
      width: 60
      height: 60
      radius: height/2
      color: "white"

      Image {
          id: img6
          source: "qrc:/images/Parking-removebg-preview.png"
          anchors.centerIn: rec6
          width: rec6.width*0.8
          height: rec6.height*0.8
      }
  }

  Rectangle{
      id:rec7
      x:250
      y:520
      width: 100
      height: 100

      Image {
          id: img7
          source: "qrc:/images/Steereing_System-removebg-preview.png"
          anchors.centerIn: rec7
          width: rec7.width
          height: rec7.height
      }
      MouseArea{
          anchors.fill: parent
          onClicked: {
              thirdwindow.source="ThirdWindow.qml"
              thirdwindow.item.visible=true
          }
      }
  }
  Loader {
         id:thirdwindow
         source: ""
         visible: false
     }

}
