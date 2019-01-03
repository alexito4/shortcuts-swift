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
