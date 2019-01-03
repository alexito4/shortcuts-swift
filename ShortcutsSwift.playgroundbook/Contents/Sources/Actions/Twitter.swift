import Foundation

public func tweet(showComposeSheet: Bool = true) -> Action {
    return Action(
        identifier: "is.workflow.actions.tweet",
        parameters: [
            "WFSocialActionShowComposeSheet": showComposeSheet,
            ]
    )
}
