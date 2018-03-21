//
//  UIAlertController.swift
//  ShortHandAlert
//
//  Created by mironal on 2018/03/21.
//  Copyright © 2018年 mironal. All rights reserved.
//

import UIKit

private extension UIAlertController {

    func addAction(_ title: String?, style: UIAlertActionStyle, handler: ((UIAlertAction) -> Void)?) -> Self {
        addAction(UIAlertAction(title: title, style: style, handler: handler))
        return self
    }
}

public extension UIAlertController {

    /// A short hand of `addAction(UIAlertAction(title: title, style: .default, handler: handler))`.
    ///
    /// ```
    /// let alert = // create alert or actionSheet
    /// alert.default("title")
    /// // or
    /// alert.default("title"){ action in
    ///   // do something.
    /// }
    /// ```
    ///
    /// - Parameters:
    ///   - title: The text for the action button title.
    ///   - handler: A block to execute when the user selects the action.
    /// - Returns: An instance of itself.
    @discardableResult
    @objc
    public func `default`(_ title: String?, handler: ((UIAlertAction) -> Void)? = nil) -> Self {
        return addAction(title, style: .default, handler: handler)
    }

    /// A short hand of `addAction(UIAlertAction(title: title, style: .default, handler: handler))`.
    /// This method is useful for .alert style. it contains TextFields in handler.
    ///
    /// ```
    /// let alert = // create alert or actionSheet
    /// alert.default("title")
    /// // or
    /// alert.default("title"){ (action, textFields) in
    ///   // do something.
    /// }
    /// ```
    ///
    /// - Parameters:
    ///   - title: The text for the action button title.
    ///   - handler: A block to execute when the user selects the action.
    /// - Returns: An instance of itself.
    @discardableResult
    @objc(`default`:handlerWithTextField:)
    public func `default`(_ title: String?, handler: ((UIAlertAction, [UITextField]?) -> Void)?) -> Self {
        return `default`(title) { handler?($0, self.textFields) }
    }

    /// A short hand of `default("OK", handler: handler)`.
    ///
    /// ```
    /// let alert = // create alert or actionSheet
    /// alert.ok()
    /// // or
    /// alert.ok { action in
    ///   // do something.
    /// }
    /// ```
    /// - Parameter handler: A block to execute when the user selects the action.
    /// - Returns: An instance of itself.
    @discardableResult
    @objc
    public func ok(_ handler: ((UIAlertAction) -> Void)? = nil) -> Self {
        return `default`("OK", handler: handler)
    }

    /// A short hand of `default("OK", handler: handler)`.
    /// This method is useful for .alert style. it contains TextFields in handler.
    ///
    /// ```
    /// let alert = // create alert or actionSheet
    /// alert.ok()
    /// // or
    /// alert.ok { (action, textFields) in
    ///   // do something.
    /// }
    /// ```
    ///
    /// - Parameter handler: A block to execute when the user selects the action.
    /// - Returns: An instance of itself.
    @discardableResult
    @objc(okWithTextField:)
    public func ok(_ handler: ((UIAlertAction, [UITextField]?) -> Void)?) -> Self {
        return `default`("OK", handler: handler)
    }

    /// A short hand of `addAction(UIAlertAction(title: title, style: .cancel, handler: handler))`.
    ///
    /// ```
    /// let alert = // create alert or actionSheet
    /// alert.cancel()
    /// // or
    /// alert.cancel("title")
    /// // or
    /// alert.cancel("title") { action in
    ///   // do something.
    /// }
    /// ```
    /// - Parameters:
    ///   - title: The text for the action button title. Default is "Cancel".
    ///   - handler: A block to execute when the user selects the action.
    /// - Returns: An instance of itself.
    @discardableResult
    @objc
    public func cancel(_ title: String? = "Cancel", handler: ((UIAlertAction) -> Void)? = nil) -> Self {
        return addAction(title, style: .cancel, handler: handler)
    }

    /// A short hand of `addAction(UIAlertAction(title: title, style: .cancel, handler: handler))`.
    /// This method is useful for .alert style. it contains TextFields in handler.
    ///
    /// ```
    /// let alert = // create alert or actionSheet
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
    ///   - title: The text for the action button title. Default is "Cancel".
    ///   - handler: A block to execute when the user selects the action.
    /// - Returns: An instance of itself.
    @discardableResult
    @objc(cancel:handlerWithTextField:)
    public func cancel(_ title: String? = "Cancel", handler: ((UIAlertAction, [UITextField]?) -> Void)?) -> Self {
        return cancel(title) { handler?($0, self.textFields) }
    }

    /// A short hand of `addAction(UIAlertAction(title: title, style: .destructive, handler: handler))`.
    ///
    /// - Parameters:
    ///   - title: The text for the action button title.
    ///   - handler: A block to execute when the user selects the action.
    /// - Returns: An instance of itself.
    @discardableResult
    @objc
    public func destructive(_ title: String?, handler: ((UIAlertAction) -> Void)? = nil) -> Self {
        return addAction(title, style: .destructive, handler: handler)
    }

    /// A short hand of `addAction(UIAlertAction(title: title, style: .destructive, handler: handler))`.
    /// This method is useful for .alert style. it contains TextFields in handler.
    ///
    /// - Parameters:
    ///   - title: The text for the action button title.
    ///   - handler: A block to execute when the user selects the action.
    /// - Returns: An instance of itself.
    @discardableResult
    @objc(destructive:handlerWithTextField:)
    public func destructive(_ title: String?, handler: ((UIAlertAction, [UITextField]?) -> Void)?) -> Self {
        return destructive(title) { handler?($0, self.textFields) }
    }

    /// Present the alert on a given view controller.
    ///
    /// ```
    /// let alert = // create alert or actionSheet
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

    /// A short hand of `addTextField(configurationHandler:)`
    ///
    /// ```
    /// let alert = // create alert
    /// alert.textField { textField in
    ///  configure textField.
    /// }
    /// ```
    ///
    /// - Parameter configurationHandler: A block for configuring the text field prior to displaying the alert.
    @discardableResult
    @objc
    public func textField(_ configurationHandler: ((UITextField) -> Void)? = nil) -> Self {
        addTextField(configurationHandler: configurationHandler)
        return self
    }

    /// A short hand of `addTextField(configurationHandler:)`.
    /// This method is useful if you only want to set default text or placeholders in a TextField.
    ///
    /// ```
    /// let alert = // create alert
    /// alert.textField("default text", placeholder: "placeholder")
    /// ```
    ///
    /// - Parameters:
    ///   - defaultText: The text for TextField.
    ///   - placeholder: the text for TextField placeholder.
    @discardableResult
    @objc
    public func textField(_ defaultText: String? = nil, placeholder: String? = nil) -> Self {
        return textField { textField in
            textField.placeholder = placeholder
            textField.text = defaultText
        }
    }
}
