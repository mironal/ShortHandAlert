//
//  ViewController.swift
//  Demo
//
//  Created by mironal on 2018/03/21.
//  Copyright © 2018年 mironal. All rights reserved.
//

import UIKit
import ShortHandAlert

class ViewController: UIViewController {

    @IBAction func pushActionSheet1(_ sender: Any) {

        // without action handler.

        UIAlertController(title: "Action Sheet 1", message: nil, preferredStyle: .actionSheet)
            .default(".default style title")
            .destructive(".destructive style title")
            .cancel()
            .present(in: self)
    }

    @IBAction func pushActionSheet2(_ sender: Any) {

        // with action handler.

        UIAlertController(title: "Action Sheet 2", message: nil, preferredStyle: .actionSheet)
            .default(".default style title") { _ in
                print("select default")
            }.destructive(".destructive style title") { _ in
                print("select destructive")
            }.cancel("custom cancel msg") { _ in
                print("select cancel")
            }.present(in: self)
    }

    @IBAction func pushAlert1(_ sender: Any) {

        // without action handler.

        UIAlertController(title: "Alert 1", message: nil, preferredStyle: .alert)
            .ok()
            .cancel()
            .present(in: self)
    }

    @IBAction func pushAlert2(_ sender: Any) {

        // with text fields.

        UIAlertController(title: "Alert 2", message: "some message.", preferredStyle: .alert)
            .textField("default text", placeholder: "placeholder")
            .default("(っ＞ω＜c)") { (_, textFields) in
                print("(っ＞ω＜c)", textFields?.first?.text ?? "")
            }
            .cancel()
            .present(in: self)
    }
}
