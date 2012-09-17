import QtQuick 1.1

Column{
    opacity: ApplicationAdSponsored ? 1.0 : 0.0

    property url link: 'http://cute-cube.com'
    property url target: 'http://cute-cube.com'

    Item{
        width: 216
        height: 54

        Image{
            anchors.fill: parent
            fillMode: Image.PreserveAspectFit
            source: "images/mobile-image-aspect-216x54.gif"
        }

        MouseArea{
            anchors.fill: parent
            onClicked: Qt.openUrlExternally(target)
        }
    }

    Text{
        font.pointSize: 4
        text: "<font color=gray>[Ad] </color><a href=link>" + link + "</a></font>"
        onLinkActivated: Qt.openUrlExternally(target);
    }
}
