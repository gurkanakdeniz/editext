import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0

ApplicationWindow {
    visible: true
    width: 640
    height: 540
    title: qsTr("Note")

    background:  Rectangle {
        color: "#595959"
    }

    SwipeView {
        id: swipeView
        anchors.fill: parent
        currentIndex: tabBar.currentIndex

        Page1 {
        }

        Page {
            Label {
                text: qsTr("Second page")
                anchors.centerIn: parent
            }
        }
    }

    footer: TabBar {
        id: tabBar
        x: 450
        y: 0
        width: 200
        height: 40
        scale: 0.8
        currentIndex: swipeView.currentIndex

        TabButton {
            text: qsTr("Yaz")
        }
        TabButton {
            text: qsTr("Notlar")
        }
        background:  Rectangle {
            color: "transparent"
        }
    }
}
