
import ShortcutsSwift

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
