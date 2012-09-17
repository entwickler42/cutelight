import QtQuick 1.1

Item {
    width: 40
    height: parent.height

    property int percentage: 0

    Rectangle{
        id: surface
        anchors.fill: parent
        anchors{ leftMargin: 15; rightMargin: 15 }
        color: "lightblue"
        opacity: 0.8
        border.width: 2
        border.color: Qt.darker(color)
    }

    Rectangle{
        id: slider
        width: parent.width
        height: 15
        color: "lightblue"
        opacity: 0.8
        radius: 15
        smooth: true
        border.width: 2
        border.color: Qt.darker(color)

        MouseArea{
            anchors.centerIn: parent
            width: parent.width
            height: parent.height * 2.0
            drag.axis: Drag.YAxis
            drag.target: slider
            drag.maximumY: surface.height-slider.height
            drag.minimumY: 0

            onPositionChanged:
                percentage = 100.0 * slider.y / (surface.height-slider.height)
        }
    }
}
