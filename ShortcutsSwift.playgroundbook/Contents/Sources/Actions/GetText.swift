import Foundation

public func getText(_ text: String) -> ActionWithOutput {
    return Action(
        identifier: "is.workflow.actions.gettext",
        parameters: ["WFTextActionText": withInterpolatedText(text)]
    )
}
