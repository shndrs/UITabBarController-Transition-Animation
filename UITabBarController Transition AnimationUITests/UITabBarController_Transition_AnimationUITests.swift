//
//  UITabBarController_Transition_AnimationUITests.swift
//  UITabBarController Transition AnimationUITests
//
//  Created by NP2 on 5/25/19.
//  Copyright © 2019 shndrs. All rights reserved.
//

import XCTest

class UITabBarController_Transition_AnimationUITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testTabBar() {
        
        
        let tabBarsQuery = XCUIApplication().tabBars
        let item2Button = tabBarsQuery.buttons["Item 2"]
        item2Button.tap()
        
        let item1Button = tabBarsQuery.buttons["Item 1"]
        item1Button.tap()
        XCUIDevice.shared.orientation = .landscapeRight
        item2Button.tap()
        XCUIDevice.shared.orientation = .portraitUpsideDown
        XCUIDevice.shared.orientation = .landscapeLeft
        item1Button.tap()
        XCUIDevice.shared.orientation = .portrait
        item2Button.tap()
        
        
    }

}
