import QtQuick 2.9
import QtQuick.Layouts 1.3
import QtQuick.Window 2.2
import QtQuick.Controls 1.4 as OldControls
import QtQuick.Controls 2.2
import QtQuick.Dialogs 1.2

ApplicationWindow {
    id: appWindow
    visible: true
    width: 640
    height: 480
    title: qsTr("Open file dialog")

    property int elementMargin: 5

    FileDialog{
        id: openFileDialog
        title: "Open file"
        folder: shortcuts.home
        selectExisting: true
        nameFilters: ["All files (*)"]
        onAccepted: {
            fileNameTextField.text = fileUrl;
        }
        onRejected: {
            fileNameTextField.text = "Canceled";
        }
    }

    TextField {
        id :fileNameTextField
        width: (parent.width*4)/5 - openFileBtn.anchors.leftMargin - openFileBtn.anchors.rightMargin
               - anchors.leftMargin;

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
    }

    OldControls.TableView {
        id : tableView

        frameVisible: false
        sortIndicatorVisible: true

        property int tableViewWidth: parent.width - 2*elementMargin

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

        OldControls.TableViewColumn {
            role: "user_id"
            title: "User ID"
            width: tableView.viewport.width/3
        }
        OldControls.TableViewColumn {
            role: "user_name"
            title: "User name"
            width: tableView.viewport.width/3
        }
        OldControls.TableViewColumn {
            role: "phone_number"
            title: "Phone number"
            width: tableView.viewport.width/3
        }

    }
}
