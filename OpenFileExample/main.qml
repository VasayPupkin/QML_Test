//https://doc-snapshots.qt.io/qt5-5.12/qml-qtquick-tableview.html#details
//https://doc.qt.io/qt-5/qtquick-modelviewsdata-cppmodels.html
//https://andrew-jones.com/blog/qml2-to-c---and-back-again-with-signals-and-slots/ !!!!!
//https://felgo.com/cross-platform-development/how-to-expose-a-qt-cpp-class-with-signals-and-slots-to-qml
import QtQuick 2.9
import QtQuick.Layouts 1.3
import QtQuick.Window 2.2
import QtQuick.Controls 1.4 as OldControls
import QtQuick.Controls 2.2
import QtQuick.Dialogs 1.2

import TableModel 0.1

ApplicationWindow {
    id: appWindow
    visible: true
    width: 640
    height: 480
    title: qsTr("Open file dialog")

    property int elementMargin: 5
    signal setFileName(string str)

    function test() {
        openFileBtn.text = "Close file";
    }

    FileDialog{
        id: openFileDialog
        title: "Open file"
        folder: shortcuts.home
        selectExisting: true
        nameFilters: ["All files (*)"]
        onAccepted: {
            fileNameTextField.text = fileUrl;
            setFileName(fileNameTextField.text);
        }
        onRejected: {
            fileNameTextField.text = "Canceled";
            setFileName("");
        }
    }

    TextField {
        id :fileNameTextField
        width: (parent.width*4)/5 - openFileBtn.anchors.leftMargin - openFileBtn.anchors.rightMargin
               - anchors.leftMargin;
        height: 40

        anchors {
            top: parent.top
            left: parent.left
            leftMargin: elementMargin
            topMargin: elementMargin
        }
        readOnly: true
        horizontalAlignment: TextInput.AlignHCenter
    }

    Button {
        id: openFileBtn
        width: parent.width/5
        height: fileNameTextField.height
        anchors {
            top: parent.top
            left: fileNameTextField.right
            topMargin: elementMargin
            leftMargin: elementMargin
            rightMargin: elementMargin
        }
        text: "Open file"
        onClicked: {
            openFileDialog.open();
        }

        background: Rectangle {
            color: "red"
        }
    }

    OldControls.TableView {
        id : tableView

        frameVisible: false
        sortIndicatorVisible: true

        property int tableViewWidth: parent.width - 2*elementMargin
        clip: true

        anchors {
            left: parent.left
            right: parent.right
            top: fileNameTextField.bottom
            bottom: parent.bottom
            leftMargin: elementMargin
            rightMargin: elementMargin
            topMargin: elementMargin
            bottomMargin: elementMargin
        }

        model: TableModel {}
        itemDelegate: Rectangle {
            implicitWidth: 50
            implicitHeight: 50
            Text {
                text: display
            }
        }

//        OldControls.TableViewColumn {
//            role: "user_id"
//            title: "User ID"
//            width: tableView.viewport.width/3
//            movable: false
//            resizable: false

//        }
//        OldControls.TableViewColumn {
//            role: "user_name"
//            title: "User name"
//            width: tableView.viewport.width/3
//            movable: false
//            resizable: false
//        }
//        OldControls.TableViewColumn {
//            role: "phone_number"
//            title: "Phone number"
//            width: tableView.viewport.width/3
//            movable: false
//            resizable: false
//        }

    }
}
