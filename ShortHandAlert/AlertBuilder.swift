//
//  AlertBuilder.swift
//  ShortHandAlert
//
//  Created by mironal on 2018/03/21.
//  Copyright © 2018年 mironal. All rights reserved.
//

import Foundation

/// Declare a method to present alert to the view controller.
@objc
public protocol Present: class {

    /// Present the alert on a given view controller.
    ///
    /// - Parameters:
    ///   - vc: The view controller.
    ///   - flag: Pass true to animate the presentation; otherwise, pass false.
    ///   - completion: The block to execute after the presentation finishes.
    func present(in vc: UIViewController, animated flag: Bool, completion: (() -> Void)?)

    /// Present the alert on a given view controller.
    /// The completion block is nil.
    ///
    /// - Parameters:
    ///   - vc: The view controller.
    ///   - flag: Pass true to animate the presentation; otherwise, pass false.
    func present(in vc: UIViewController, animated flag: Bool)

    /// Present the alert on a given view controller.
    /// The animated flag is true, and the completion block is nil.
    ///
    /// - Parameter vc: The view controller.
    func present(in vc: UIViewController)
}

extension UIAlertController: Present {

    public func present(in vc: UIViewController, animated flag: Bool) {
        present(in: vc, animated: flag) {}
    }

    public func present(in vc: UIViewController) {
        present(in: vc, animated: true)
    }
}

/// Declare a method to add an approvable action.
@objc
public protocol Approve: class {

    /// Add an approvable action like "OK" and returns a presentable object.
    ///
    /// - Returns: A presentable object.
    func approve() -> Present

    /// Add an approvable action like "OK" and returns a presentable object.
    ///
    /// - Parameter handler: A block to execute when the user selects the action.
    /// - Returns: A presentable object.
    func approve(_ handler: @escaping ((UIAlertAction) -> Void)) -> Present

    /// Add an approvable action like "OK" and returns a presentable object.
    ///
    /// - Parameter title: The title of the action.
    /// - Returns: A presentable object.
    func approve(title: String) -> Present

    /// Add an approvable action like "OK" and returns a presentable object.
    ///
    /// - Parameters:
    ///   - title: The title of the action.
    ///   - handler: A block to execute when the user selects the action.
    /// - Returns: A presentable object.
    func approve(title: String, handler: @escaping ((UIAlertAction) -> Void)) -> Present
}

extension UIAlertController: Approve {

    public func approve() -> Present {
        return approve(title: "OK")
    }

    public func approve(_ handler: @escaping ((UIAlertAction) -> Void)) -> Present {
        return approve(title: "OK", handler: handler)
    }
    public func approve(title: String) -> Present {
        return approve(title: title) { _ in }
    }

    public func approve(title: String, handler: @escaping ((UIAlertAction) -> Void)) -> Present {
        return `default`(title, handler: handler)
    }
}

/// Declare a method to add a destructive action.
@objc
public protocol DestructiveApprove {

    /// Add a destructive action like "Destroy" and returns a presentable object.
    ///
    /// - Parameters:
    ///   - title: The title of the action.
    ///   - handler: A block to execute when the user selects the action.
    /// - Returns: A presentable object.
    func destructiveApprove(title: String, handler: @escaping ((UIAlertAction) -> Void)) -> Present
}

extension UIAlertController: DestructiveApprove {
    public func destructiveApprove(title: String, handler: @escaping ((UIAlertAction) -> Void)) -> Present {
        return destructive(title, handler: handler)
    }
}

/// Declare a method to add a cancelable action.
@objc
public protocol Cancel {

    /// Add cancel action for alert and returns approvable object.
    /// The title of the action is "Cancel".
    ///
    /// - Returns: An approvable object.
    func cancel() -> Approve & DestructiveApprove

    /// Add cancel action for alert and returns approvable object.
    ///
    /// - Parameter title: The title of the action.
    /// - Returns: An approvable object.
    func cancel(title: String) -> Approve & DestructiveApprove

    /// Add cancel action for alert and returns approvable object.
    /// The title of the action is "Cancel".
    ///
    /// - Parameter handler: A block to execute when the user selects the action.
    /// - Returns: An approvable object.
    func cancel(_ handler: @escaping ((UIAlertAction) -> Void)) -> Approve & DestructiveApprove

    /// Add cancel action for alert and returns approvable object.
    ///
    /// - Parameters:
    ///   - title: The title of the action.
    ///   - handler: A block to execute when the user selects the action.
    /// - Returns: An approvable object.
    func cancel(title: String, handler: @escaping ((UIAlertAction) -> Void)) -> Approve & DestructiveApprove
}

extension UIAlertController: Cancel {

    public func cancel() -> Approve & DestructiveApprove {
        return cancel(title: "Cancel")
    }

    public func cancel(title: String) -> Approve & DestructiveApprove {
        return cancel(title: title) { _ in }
    }

    public func cancel(_ handler: @escaping ((UIAlertAction) -> Void)) -> Approve & DestructiveApprove {
        return cancel(title: "Cancel", handler: handler)
    }

    public func cancel(title: String, handler: @escaping ((UIAlertAction) -> Void)) -> Approve & DestructiveApprove {
        return cancel(title, handler: handler)
    }
}

/// A builder object that makes familiar alert easily.
@objcMembers
public class AlertBuilder: NSObject {

    private var alert: UIAlertController!

    /// Creates and returns a builder for a confirmable alert builder.
    ///
    /// ```
    /// __________________________
    /// |         Title          |
    /// |                        |
    /// |        message         |
    /// |                        |
    /// |          OK            |
    /// |________________________|
    /// ```
    ///
    /// ```
    /// AlertBuilder()
    ///   .confirm(title: "Title", message: "message")
    ///   .approve { _ in
    ///
    ///   }
    ///   .present(in: self)
    /// ```
    ///
    /// - Parameters:
    ///   - title: The title of the alert.
    ///   - message: The message of the alert.
    /// - Returns: An approvable object.
    @objc
    public func confirm(title: String? = nil, message: String?) -> Approve {
        return UIAlertController(title: title, message: message, preferredStyle: .alert)
    }

    /// Creates and returns a builder for a confirmable alert builder.
    ///
    /// ```
    /// __________________________
    /// |         Error          |
    /// |                        |
    /// |    error localized     |
    /// |      description.      |
    /// |                        |
    /// |          OK            |
    /// |________________________|
    /// ```
    ///
    /// ```
    /// AlertBuilder()
    ///   .confirm(error: error)
    ///   .approve { _ in
    ///
    ///   }
    ///   .present(in: self)
    /// ```
    ///
    /// - Parameters:
    ///   - title: The title of the alert. The default value is "Error"
    ///   - error: The error to display to the user.
    /// - Returns: An approvable object.
    public func confirm(title: String? = "Error", error: Error) -> Approve {
        return confirm(title: title, message: error.localizedDescription)
    }

    /// Creates and returns a builder for a suggestable alert.
    ///
    /// ```
    /// __________________________
    /// |         Title          |
    /// |                        |
    /// |        message         |
    /// |                        |
    /// |    Cancel      OK      |
    /// |________________________|
    /// ```
    ///
    /// ```
    /// AlertBuilder()
    ///   .suggest(title: "Title", message: "message")
    ///   .cancel { _ in
    ///
    ///   }
    ///   .approve { _ in
    ///
    ///   }
    ///   .present(in: self)
    /// ```
    ///
    /// - Parameters:
    ///   - title: The title of the alert.
    ///   - message: The message to display to the user.
    /// - Returns: A cancelable object.
    public func suggest(title: String?, message: String?) -> Cancel {
        return UIAlertController(title: title, message: message, preferredStyle: .alert)
    }

    /// Creates and returns a builder for a suggestable alert.
    ///
    /// ```
    /// __________________________
    /// |         Error          |
    /// |                        |
    /// |    error localized     |
    /// |      description.      |
    /// |                        |
    /// |    Cancel      OK      |
    /// |________________________|
    /// ```
    ///
    /// ```
    /// AlertBuilder()
    ///   .suggest(error: error)
    ///   .cancel { _ in
    ///
    ///   }
    ///   .approve { _ in
    ///
    ///   }
    ///   .present(in: self)
    /// ```
    ///
    /// - Parameters:
    ///   - title: The title of the alert. The default value is "Error"
    ///   - error: The error to display to user.
    /// - Returns: A cancelable object.
    public func suggest(title: String? = "Error", error: Error) -> Cancel {
        return suggest(title: title, message: error.localizedDescription)
    }
}
