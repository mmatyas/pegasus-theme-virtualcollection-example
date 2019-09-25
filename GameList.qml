import QtQuick 2.0

Rectangle {
    property alias model: list.model
    color: "#333"

    ListView {
        id: list

        anchors.fill: parent
        orientation: ListView.Horizontal

        delegate: GameBox {
            game: modelData
            height: ListView.view.height
            selected: ListView.isCurrentItem
            onClicked: {
                ListView.view.currentIndex = index;
                gCurrentGame = api.allGames.get(index);
            }
        }
    }
}
