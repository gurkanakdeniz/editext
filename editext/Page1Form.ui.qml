import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.Window 2.2
import QtQuick.LocalStorage 2.0
import QtQuick.Dialogs 1.2

Item {
    property alias comboBox: comboBox
    property alias comboBox1: comboBox1
    property alias comboBox2: comboBox2
    property alias button1: button1
    property alias button2: button2
    property alias textAlan: textAlan
    property alias messageDialog: messageDialog
    property alias messageDialog1: messageDialog1
    property alias textField: textField

    MessageDialog {
        id: messageDialog
        title: "Kaydet"
        text: "mevcut değişiklik?"

        standardButtons: StandardButton.Save | StandardButton.Close
        Component.onCompleted: visible = false
    }
    MessageDialog {
        id: messageDialog1
        title: "Kaydet"
        text: "aynı isimli not var?"

        standardButtons: StandardButton.Save | StandardButton.Close
        Component.onCompleted: visible = false
    }
    RowLayout {
        id: rowLayout
        x: 0
        y: 0
        width: 640
        height: 480
    }

    ToolBar {
        id: toolBar
        x: 19
        y: 13
        width: 605
        height: 60

        background: Rectangle {
            color: "transparent"
        }

        ToolButton {
            id: button2
            x: -10
            y: -5
            width: 108
            height: 31
            text: qsTr("YENI")
            scale: 0.7
            hoverEnabled: true

            background: Rectangle {
                color: button2.pressed ? '#4a4a4a' : 'green'
            }
        }
        ToolButton {
            id: button1
            x: 154
            y: -4
            width: 108
            height: 31
            hoverEnabled: true

            background: Rectangle {
                color: button1.pressed ? '#4a4a4a' : 'blue'
            }

            text: qsTr("Kaydet")
            scale: 0.7
            opacity: 0.4
            enabled: false
        }

        TextField {
            id: textField
            x: -13
            y: 34
            width: 273
            height: 27
            selectByMouse: true
            text: qsTr("Not Ismi")
            rightPadding: 2
            leftPadding: 5
            bottomPadding: 10
            topPadding: 2
            font.family: "Times New Roman"
            scale: 0.9
        }

        ToolButton {
            id: button3
            x: 72
            y: -4
            width: 108
            height: 31
            text: qsTr("F.KAYDET")
            hoverEnabled: true
            opacity: 0.4
            enabled: false
            scale: 0.7
            background: Rectangle {
                color: button3.pressed ? '#4a4a4a' : 'skyblue'
            }
        }
    }
    ComboBox {
        id: comboBox
        x: 274
        y: 38
        width: 82
        height: 32
        scale: 0.7
        model: ["9", "10", "11", "12", "13", "14", "15", "16"]
        currentIndex: 5
    }

    ComboBox {
        id: comboBox1
        x: 422
        y: 38
        width: 224
        height: 32
        padding: 16
        topPadding: 16
        spacing: 6
        scale: 0.7
        currentIndex: 1
        model: ["Arial", "Times New Roman", "Courier", "Verdana", "Tahoma"]
    }

    ComboBox {
        id: comboBox2
        x: 336
        y: 38
        width: 134
        height: 32
        scale: 0.7
        textRole: qsTr("")
        spacing: 6
        padding: 14
        model: ["Normal", "Italic", "Bold"]
    }

    Flickable {
        id: flickable
        anchors.bottomMargin: 8
        anchors.leftMargin: 15
        anchors.rightMargin: 15
        anchors.topMargin: 79
        anchors.fill: parent

        TextArea.flickable: TextArea {
            id: textAlan
            x: 10
            y: 10
            width: 587
            height: 385
            color: "#4a4a4a"
            padding: 5
            background: Rectangle {
                color: "#a6a6a6"
            }

            cursorVisible: true
            selectByMouse: true

            text: qsTr("")
            leftPadding: 2
            //        font.underline: true
            //        font.italic: true
            //        font.bold: true
            //        font.weight: Font.Normal
            font.family: "Times New Roman"
            font.pointSize: 12
            verticalAlignment: Text.AlignTop
            renderType: Text.QtRendering
            font.capitalization: Font.MixedCase
            textFormat: Text.AutoText
            wrapMode: TextArea.Wrap
        }

        ScrollBar.vertical: ScrollBar {
        }
    }
}
