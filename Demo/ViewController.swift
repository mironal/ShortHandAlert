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

        UIAlertController(title: "Title", message: "Some message.", preferredStyle: .actionSheet)
            .default(".default action title")
            .destructive(".destructive action title")
            .cancel()
            .present(in: self)
    }

    @IBAction func pushActionSheet2(_ sender: Any) {

        // with action handler.

        UIAlertController(title: "Title", message: "Some message with action handler.", preferredStyle: .actionSheet)
            .default(".default action title") { _ in
                print("select default")
            }.destructive(".destructive action title") { _ in
                print("select destructive")
            }.cancel("custom cancel title") { _ in
                print("select cancel")
            }.present(in: self)
    }

    @IBAction func pushAlert1(_ sender: Any) {

        // without action handler.

        UIAlertController(title: "Title", message: "Some message", preferredStyle: .alert)
            .ok()
            .cancel()
            .present(in: self)
    }

    @IBAction func pushAlert2(_ sender: Any) {

        // with text fields.

        UIAlertController(title: "Title", message: "Alert with text field.", preferredStyle: .alert)
            .textField("default text", placeholder: "placeholder")
            .default("りょーかい (っ＞ω＜c)") { (_, textFields) in
                print("(っ＞ω＜c)", textFields?.first?.text ?? "")
            }
            .cancel()
            .present(in: self)
    }


    @IBAction func pushAlert3(_ sender: Any) {

        let error = NSError(domain: "",
                            code: 0,
                            userInfo: [NSLocalizedDescriptionKey: "something fault."])
        AlertBuilder()
        .confirm(error: error)
        .approve()
        .present(in: self)
    }


    @IBAction func pushAlert4(_ sender: Any) {
        let error: Error = NSError(domain: "", code: 0, userInfo: nil)
        AlertBuilder()
            .suggest(error: error)
            .cancel()
            .approve(title: "Retry")
            .present(in: self)
    }
}
