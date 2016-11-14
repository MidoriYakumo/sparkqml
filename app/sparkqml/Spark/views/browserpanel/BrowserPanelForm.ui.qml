import QtQuick 2.4
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.0

Item {
    implicitWidth: 640
    implicitHeight: 480

    property alias model: componentGridView.model

    ColumnLayout {
        id: columnLayout1
        spacing: 0
        anchors.fill: parent

        BrowserActionBar {
            z: 1
            Layout.alignment: Qt.AlignLeft | Qt.AlignTop
            Layout.fillWidth: true
        }

        Rectangle {
            color: "#eaeaea"
            clip: true
            Layout.fillWidth: true
            Layout.fillHeight: true

            ComponentGridView {
                id: componentGridView

                anchors.fill: parent
                anchors.margins: 10
            }
        }

        Rectangle {
            id: browserFooterBar
            width: 200
            height: 42
            color: "#e8e9e8"
            Layout.fillHeight: true
            Layout.maximumHeight: 42
            Layout.alignment: Qt.AlignLeft | Qt.AlignBottom
            Layout.fillWidth: true

            Shadow {
                anchors.fill: parent
                z: -1
                inverted: true
            }
        }

    }
}
