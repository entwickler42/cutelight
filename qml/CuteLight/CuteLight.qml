import QtQuick 1.1
import com.cutecube.common 1.0

Rectangle {
    id: screen
    width: 360
    height: 640
    color: Qt.rgba(red, green, blue, 1.0)

    property real red: 1.0
    property real green: 1.0
    property real blue: 1.0

    CutePalette{
        id: palette
    }

    Timer{
        id: timerSos
        repeat: true
        running: false

        property int counter: 0

        onTriggered: {
            if ((counter+1) % 2){
                interval = counter > 5 ? 1000 : 500
                DisplayLight.setDisplayOff()
            }else{
                interval = counter > 5 ? 2000 : 1000
                DisplayLight.setDisplayBrightness(DisplayLight.maximumDisplayBrightness)
            }
            if (++counter == 12) counter = 0
         }
    }

    Item{
        id: buttonQuit
        width: 64
        height: 64
        anchors { right: parent.right; top: parent.top }
        anchors { rightMargin: 15; topMargin: 15 }

        Image{
            anchors.centerIn: parent
            source: mouseArea.pressed ? "icons/hibernate_alt.png" : "icons/hibernate.png"
        }

        MouseArea {
            id: mouseArea
            anchors.fill: parent
            onClicked: {
                DisplayLight.setDisplayBrightness(DisplayLight.maximumDisplayBrightness)
                viewExitAbout.opacity = 1
                timerSos.running = false
            }
        }
    }

    Item{
        width: 64
        height: 64
        anchors { left: parent.left; top: parent.top }
        anchors { leftMargin: 15; topMargin: 15 }

        AnimatedImage{
            anchors.centerIn: parent
            source: timerSos.running ? "icons/agt_announcements_alt.gif" : "icons/agt_announcements.png"
        }

        MouseArea {
            anchors.fill: parent
            onClicked: timerSos.running = !timerSos.running
        }
    }

    Advertisement{
        id: ads
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 40
    }

    Row{
        anchors{
            horizontalCenter: parent.horizontalCenter
            top: buttonQuit.bottom; bottom: ads.top
            margins: 10
        }
        spacing: 20

        Slider{ onPercentageChanged: red = 1.0 - 0.01 * percentage }
        Slider{ onPercentageChanged: green = 1.0 - 0.01 * percentage }
        Slider{ onPercentageChanged: blue = 1.0 - 0.01 * percentage }
        Slider{ onPercentageChanged: DisplayLight.setDisplayBrightness(100 - percentage) }
    }

    CuteAboutDialog{
        id: viewExitAbout
        anchors.fill: parent
        opacity: 0
        canQuit: true

        credits: CuteLightCredits{}
    }
}
