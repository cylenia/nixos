pragma Singleton

import Quickshell
import Quickshell.Services.Mpris
import QtQuick

Singleton {
    id: root

    property string media: Mpris.players.values.length > 0 ?
      ((Mpris.players.values[0].trackTitle || "Unknown Title") + " by " + (Mpris.players.values[0].trackArtist || "Unknown Artist")) : ""
}
