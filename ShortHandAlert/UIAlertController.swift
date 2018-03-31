//
//  UIAlertController.swift
//  ShortHandAlert
//
//  Created by mironal on 2018/03/21.
//  Copyright © 2018年 mironal. All rights reserved.
//

import UIKit

private extension UIAlertController {

    func addAction(_ title: String?, style: UIAlertActionStyle, addAction condition: Bool, handler: ((UIAlertAction) -> Void)?) -> Self {

        guard condition else {
            return self
        }

        if style == .cancel && actions.contains { $0.style == style } {
            #if DEBUG
                print("* Warning**: Ignored the addition of action that titled \"\(title ?? "<no name>")\", because UIAlertController can only have one action of cancel style.")
            #endif

            return self
        }

        addAction(UIAlertAction(title: title, style: style, handler: handler))

        return self
    }
}

public extension UIAlertController {

    /// A shorthand of `addAction(UIAlertAction(title: title, style: .default, handler: handler))`.
    ///
    /// ```
    /// let alert = // create alert or actionSheet
    /// alert.default("title")
    /// // or
    /// alert.default("title"){ action in
    ///   // do something.
    /// }
    /// // or
    /// alert.default("title", add: true) { action in
    ///   // do something.
    /// }
    /// ```
    ///
    /// - Parameters:
    ///   - title: The text for the action button title.
    ///   - condition: Add the action when true. The default value is true.
    ///   - handler: A block to execute when the user selects the action.
    /// - Returns: An instance of itself.
    @discardableResult
    @objc
    public func `default`(_ title: String?, addAction condition: Bool = true, handler: ((UIAlertAction) -> Void)? = nil) -> Self {
        return addAction(title, style: .default, addAction: condition, handler: handler)
    }

    /// A shorthand of `addAction(UIAlertAction(title: title, style: .default, handler: handler))`.
    /// This method is useful for the .alert style. It contains TextFields in the handler.
    ///
    /// ```
    /// let alert = // Create an alert.
    /// alert.default("title")
    /// // or
    /// alert.default("title"){ (action, textFields) in
    ///   // do something.
    /// }
    /// ```
    ///
    /// - Parameters:
    ///   - title: The text for the action button title.
    ///   - condition: Add the action when true. The default value is true.
    ///   - handler: A block to execute when the user selects the action.
    /// - Returns: An instance of itself.
    @discardableResult
    @objc(default:addAction:handlerWithTextField:)
    public func `default`(_ title: String?, addAction condition: Bool = true, handler: ((UIAlertAction, [UITextField]?) -> Void)?) -> Self {
        return `default`(title, addAction: condition) { handler?($0, self.textFields) }
    }

    /// A shorthand of `default("OK", handler: handler)`.
    ///
    /// ```
    /// let alert = // Create an alert or an actionSheet.
    /// alert.ok()
    /// // or
    /// alert.ok { action in
    ///   // do something.
    /// }
    /// ```
    /// - Parameters:
    ///   - condition: Add the action when true. The default value is true.
    ///   - handler: handler: A block to execute when the user selects the action.
    /// - Returns: An instance of itself.
    @discardableResult
    @objc(okToAddAction:handler:)
    public func ok(addAction condition: Bool = true, _ handler: ((UIAlertAction) -> Void)? = nil) -> Self {
        return `default`("OK", addAction: condition, handler: handler)
    }

    /// A short hand of `default("OK", handler: handler)`.
    /// This method is useful for the .alert style. It contains TextFields in the handler.
    ///
    /// ```
    /// let alert = // Create an alert.
    /// alert.ok()
    /// // or
    /// alert.ok { (action, textFields) in
    ///   // do something.
    /// }
    /// ```
    ///
    /// - Parameters:
    ///   - condition: Add the action when true. The default value is true.
    ///   - handler: handler: A block to execute when the user selects the action.
    /// - Returns: An instance of itself.
    @discardableResult
    @objc(okToAddAction:handlerWithTextField:)
    public func ok(addAction condition: Bool = true, _ handler: ((UIAlertAction, [UITextField]?) -> Void)?) -> Self {
        return `default`("OK", addAction: condition, handler: handler)
    }

    /// A shorthand of `addAction(UIAlertAction(title: title, style: .cancel, handler: handler))`.
    ///
    /// ```
    /// let alert = // Create an alert or an actionSheet.
    /// alert.cancel()
    /// // or
    /// alert.cancel("title")
    /// // or
    /// alert.cancel("title") { action in
    ///   // do something.
    /// }
    /// ```
    /// - Parameters:
    ///   - title: The text for the action button title. The default value is "Cancel".
    ///   - condition: Add the action when true. The default value is true.
    ///   - handler: A block to execute when the user selects the action.
    /// - Returns: An instance of itself.
    @discardableResult
    @objc
    public func cancel(_ title: String? = "Cancel", addAction condition: Bool = true, handler: ((UIAlertAction) -> Void)? = nil) -> Self {
        return addAction(title, style: .cancel, addAction: condition, handler: handler)
    }

    /// A shorthand of `addAction(UIAlertAction(title: title, style: .cancel, handler: handler))`.
    /// This method is useful for the .alert style. It contains TextFields in the handler.
    ///
    /// ```
    /// let alert = // Create an alert.
    /// alert.cancel()
    /// // or
    /// alert.cancel("title")
    /// // or
    /// alert.cancel("title") { (action, textFields) in
    ///   // do something.
    /// }
    /// ```
    ///
    /// - Parameters:
    ///   - title: The text for the action button title. The default value is "Cancel".
    ///   - condition: Add the action when true. The default value is true.
    ///   - handler: A block to execute when the user selects the action.
    /// - Returns: An instance of itself.
    @discardableResult
    @objc(cancel:toAddAction:handlerWithTextField:)
    public func cancel(_ title: String? = "Cancel", addAction condition: Bool = true, handler: ((UIAlertAction, [UITextField]?) -> Void)?) -> Self {
        return cancel(title, addAction: condition) { handler?($0, self.textFields) }
    }

    /// A shorthand of `addAction(UIAlertAction(title: title, style: .destructive, handler: handler))`.
    ///
    /// - Parameters:
    ///   - title: The text for the action button title.
    ///   - condition: Add the action when true. The default value is true.
    ///   - handler: A block to execute when the user selects the action.
    /// - Returns: An instance of itself.
    @discardableResult
    @objc
    public func destructive(_ title: String?, addAction condition: Bool = true, handler: ((UIAlertAction) -> Void)? = nil) -> Self {
        return addAction(title, style: .destructive, addAction: condition, handler: handler)
    }

    /// A shorthand of `addAction(UIAlertAction(title: title, style: .destructive, handler: handler))`.
    /// This method is useful for the .alert style. It contains TextFields in the handler.
    ///
    /// - Parameters:
    ///   - title: The text for the action button title.
    ///   - condition: Add the action when true. The default value is true.
    ///   - handler: A block to execute when the user selects the action.
    /// - Returns: An instance of itself.
    @discardableResult
    @objc(destructive:toAddAction:handlerWithTextField:)
    public func destructive(_ title: String?, addAction condition: Bool = true, handler: ((UIAlertAction, [UITextField]?) -> Void)?) -> Self {
        return destructive(title, addAction: condition) { handler?($0, self.textFields) }
    }

    /// Present the alert on a given view controller.
    ///
    /// ```
    /// let alert = // Create an alert or an actionSheet.
    /// alert.present(in: viewController)
    /// // or
    /// alert.present(in: self, animated: true) {
    ///    print("do some thing after the presentation finishes.")
    /// }
    /// ```
    /// - Parameters:
    ///   - vc: The parent view controller.
    ///   - flag: Pass true to animate the presentation; otherwise, pass false.
    ///   - completion: The block to execute after the presentation finishes.
    @objc public func present(in vc: UIViewController, animated flag: Bool = true, completion: (() -> Void)? = nil) {
        vc.present(self, animated: flag, completion: completion)
    }

    /// A shorthand of `addTextField(configurationHandler:)`
    ///
    /// ```
    /// let alert = // Create an alert.
    /// alert.textField { textField in
    ///  configure textField.
    /// }
    /// ```
    ///
    /// - Parameters:
    ///   - condition: Add the action when true. The default value is true.
    ///   - configurationHandler: A block for configuring the text field prior to displaying the alert.
    /// - Returns: An instance of itself.
    @discardableResult
    @objc
    public func textField(addTextField condition: Bool = true, _ configurationHandler: ((UITextField) -> Void)? = nil) -> Self {
        if condition {
            addTextField(configurationHandler: configurationHandler)
        }
        return self
    }

    /// A shorthand of `addTextField(configurationHandler:)`.
    /// This method is useful if you only want to set default text or placeholders in a TextField.
    ///
    /// ```
    /// let alert = // Create an alert.
    /// alert.textField("default text", placeholder: "placeholder")
    /// ```
    ///
    /// - Parameters:
    ///   - condition: Add the action when true. The default value is true.
    ///   - defaultText: The text for TextField.
    ///   - placeholder: the text for TextField placeholder.
    /// - Returns: An instance of itself.
    @discardableResult
    @objc
    public func textField(addTextField condition: Bool = true, _ defaultText: String? = nil, placeholder: String? = nil) -> Self {
        return textField(addTextField: condition) { textField in
            textField.placeholder = placeholder
            textField.text = defaultText
        }
    }
}
