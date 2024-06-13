//
//  Assignment_7Tests.swift
//  Assignment_7Tests
//
//  Created by E5000861 on 29/05/24.
//

import XCTest
@testable import Assignment_7

final class Assignment_7Tests: XCTestCase {
    var viewController: ViewController!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

 
    
    
    func testSliderValueChanged() {
        let expectation = XCTestExpectation(description: "Slider value changes image view background color")
        
        viewController.sliderDemo.value = 75
        viewController.sliderValueChanged(sender: viewController.sliderDemo)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            let color = self.viewController.imageView.backgroundColor!
            XCTAssertEqual(color, UIColor(red: 0.375, green: 0.375, blue: 0.375, alpha: 1.0))
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 2.0)
    }
    
    func testSwitchValueChanged() {
        let expectation = XCTestExpectation(description: "Switch value changes view background color")
        
        viewController.switchDemo.isOn = false
        viewController.switchValueChanged(sender: viewController.switchDemo)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            let color = self.viewController.view.backgroundColor!
            XCTAssertEqual(color, UIColor.systemBlue)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 2.0)
    }


}
