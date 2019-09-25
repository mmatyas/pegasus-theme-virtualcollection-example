import QtQuick 2.0
import SortFilterProxyModel 0.2

FocusScope {
    property var gCurrentGame: null

    SortFilterProxyModel {
        id: filteredGames
        sourceModel: api.allGames
        filters: ValueFilter {
            roleName: "favorite"
            value: true
        }
    }

    property var newCollection: {
        return {
            name: "My Example Favorites",
            games: filteredGames,
        }
    }

    ListView {
        anchors.fill: parent
        model: [newCollection, ...api.collections.toVarArray()]
        delegate: collectionDelegate
    }

    Component {
        id: collectionDelegate

        Column {
            width: ListView.view.width
            Text {
                text: modelData.name
                color: "#fff"
            }
            GameList {
                model: modelData.games
                anchors.left: parent.left
                anchors.right: parent.right
                height: 150
            }
        }
    }
}
