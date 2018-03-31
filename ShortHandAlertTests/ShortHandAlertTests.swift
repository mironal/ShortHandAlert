//
//  ShortHandAlertTests.swift
//  ShortHandAlertTests
//
//  Created by mironal on 2018/03/21.
//  Copyright © 2018年 mironal. All rights reserved.
//

import XCTest
@testable import ShortHandAlert

class ShortHandAlertTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testCanBuildAlert() {
        UIAlertController(title: "title", message: "message", preferredStyle: .alert)
            .default("without action handler")
            .default("with action handler") { _ in }
            .default("with action handler with textfields") { (_, _) in }
            .default("without action handler", addAction: true)
            .default("with action handler", addAction: true) { _ in }
            .default("with action handler with textfields", addAction: true) { (_, _) in }
            .ok()
            .ok { _ in }
            .ok { (_, _) in }
            .ok(addAction: true)
            .ok(addAction: true) { _ in }
            .ok(addAction: true) { (_, _) in }
            .destructive("without action handler")
            .destructive("with action handler") { _ in }
            .destructive("with action handler with textfields") { (_, _) in }
            .destructive("without action handler", addAction: true)
            .destructive("with action handler", addAction: true) { _ in }
            .destructive("with action handler with textfields", addAction: true) { (_, _) in }
            .cancel()
            .cancel { _ in }
            .cancel { (_, _) in }
            .cancel(addAction: true)
            .cancel(addAction: true) { _ in }
            .cancel(addAction: true) { (_, _) in }
            .cancel("Custom title")
            .cancel("Custom title") { _ in }
            .cancel("Custom title") { (_, _) in }
            .cancel("Custom title", addAction: true)
            .cancel("Custom title", addAction: true) { _ in }
            .cancel("Custom title", addAction: true) { (_, _) in }
            .textField()
            .textField { _ in }
            .textField(addTextField: true)
            .textField(addTextField: true) { _ in }
            .textField("default text", placeholder: "placeholder")
            .textField(addTextField: true, "default text", placeholder: "placeholder")
    }
}
