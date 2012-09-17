import QtQuick 1.1
import com.cutecube.common 1.0

Column{
    anchors{ left: parent.left; right: parent.right }
    spacing: 12

    CuteText{
        state: "big"
        anchors{ left: parent.left; right: parent.right }
        horizontalAlignment: Text.AlignHCenter
        font.bold: true
        text: qsTr("Icons")
    }
    CuteText{
        anchors.horizontalCenter: parent.horizontalCenter
        onLinkActivated: Qt.openUrlExternally(link)
        text: "<div align=center>Crystal Icon Set<br><a href=\"http://www.everaldo.com/crystal/\">www.everaldo.com</a></div>"
        font.bold: true
    }
}
