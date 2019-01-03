import Foundation

public func getCurrentSong() -> ActionWithOutput {
    return Action(identifier: "is.workflow.actions.getcurrentsong", parameters: [:])
}
