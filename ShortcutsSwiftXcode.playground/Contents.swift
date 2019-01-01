
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

let batteryLevel = actionOutput()
let shortcut = buildShortcut(
    comment("This Shortcut was generated in Swift.") +
        getBatteryLevel().savingOutput(to: batteryLevel) +
        ifLessThan(20, ifTrue: (
            setLowPowerMode(true) +
                showResult("Your battery is at \(batteryLevel)%, you might want to charge it.")
            ), ifFalse: (
                showResult("Your battery is at \(batteryLevel)%, you're probably fine for now.")
        ))
)

//print(shortcut)
saveShortcut(shortcut, name: "batery")
