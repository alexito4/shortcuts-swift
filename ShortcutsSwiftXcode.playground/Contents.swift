
import ShortcutsSwift

import Foundation
import PlaygroundSupport
public func saveShortcut(_ shortcut: PropertyList, name: String) {
    let data = exportShortcut(shortcut)
    func save(ext: String) {
        let fileURL = URL(fileURLWithPath: "")
            .appendingPathComponent(name)
            .appendingPathExtension(ext)
        try! data.write(to: fileURL)
        print("open \(fileURL.deletingLastPathComponent().absoluteString.dropFirst(7))")
    }
    save(ext: "shortcut")
    // TESTING
    save(ext: "plist")
}

public func getCurrentSong() -> ActionWithOutput {
    return Action(identifier: "is.workflow.actions.getcurrentsong", parameters: [:])
}

public func getText(_ text: String) -> ActionWithOutput {
    return Action(
        identifier: "is.workflow.actions.gettext",
        parameters: ["WFTextActionText": withInterpolatedText(text)]
    )
}

public func tweet(showComposeSheet: Bool = true) -> Action {
    return Action(
        identifier: "is.workflow.actions.tweet",
        parameters: [
            "WFSocialActionShowComposeSheet": showComposeSheet,
        ]
    )
}

let song = actionOutput()
let title = song.with(propertyName: .custom("Title"), userInfo: .string("title"))
let artist = song.with(propertyName: .custom("Artist"), userInfo: .string("artist"))
let albumArtwork = song.with(propertyName: .custom("Album Artwork"), userInfo: .string("artwork"))
let tweetText = actionOutput(name: "Tweet")

let shortcut = buildShortcut(comment("This Shortcut was generated in Swift.")
    + getCurrentSong().savingOutput(to: song)
    + getText("Listening to \(title) by \(artist) using Swift!").savingOutput(to: tweetText)
    + list(["\(tweetText)", "\(albumArtwork)"])
    + tweet()
)

//print(shortcut)
saveShortcut(shortcut, name: "tweet song swift")
