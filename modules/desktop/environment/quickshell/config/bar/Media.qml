pragma Singleton

import Quickshell
import Quickshell.Services.Mpris
import QtQuick

Singleton {
    id: root

    readonly property var currentPlayer: Mpris.players.values[0]
    readonly property bool hasPlayer: Mpris.players.values.length > 0
    
    readonly property string trackUrl: hasPlayer ? currentPlayer.metadata["xesam:url"] || "" : ""
    readonly property bool isMonochrome: trackUrl.includes("monochrome.tf")
    
    readonly property bool shouldShow: isMonochrome
    
    readonly property string trackTitle: currentPlayer?.trackTitle || "Unknown Title"
    readonly property string trackArtist: {
        var artist = currentPlayer?.trackArtist
        return Array.isArray(artist) ? artist.join(", ") : (artist || "Unknown Artist")
    }
    
    readonly property string media: shouldShow ? trackTitle + " by " + trackArtist : ""
}
