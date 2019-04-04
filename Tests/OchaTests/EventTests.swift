//
//  EventTests.swift
//  OchaTests
//
//  Created by Yudai.Hirose on 2019/03/02.
//

import XCTest
@testable import Ocha

class EventTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
}

class EventArrayTests: XCTestCase {
    func testIsAddedFileInXcodeEvent() {
        typealias EventFactory = (EventSet) -> Event
        XCTContext.runActivity(named: "When first element has '.dat.' file") { (_) in
            let firstElementFactory: EventFactory = { eventSet in
                return Event(id: 1, flag: eventSet.rawValue, path: "/Users/bannzai/development/.dat.hoge.fuga")
            }
            
            let secondElementFactory: EventFactory = { eventSet in
                return Event(id: 2, flag: eventSet.rawValue, path: "/Users/bannzai/development/piyo.swift")
            }
            
            XCTContext.runActivity(named: "When first element has xcode temporary file events", block: { (_)  in
                let firstElement = firstElementFactory(.xcodeFileAddedFirstEventSet)
                XCTContext.runActivity(named: "And second element renamed file element.", block: { (_) in
                    let secondElement = secondElementFactory(.xcodeFileAddedSecondEventSet)
                    XCTAssertTrue([firstElement, secondElement].isAddedFileInXcodeEvent())
                })
                
                XCTContext.runActivity(named: "And second element didn't rename file element", block: { _ in
                    let secondElement = secondElementFactory(.none)
                    XCTAssertFalse([firstElement, secondElement].isAddedFileInXcodeEvent())
                })
            })
            
            XCTContext.runActivity(named: "When first element does not have xcode temporary file events", block: { (_) in
                let firstElement = firstElementFactory(.none)
                let secondElement = secondElementFactory(.xcodeFileAddedSecondEventSet)
                XCTAssertFalse([firstElement, secondElement].isAddedFileInXcodeEvent())
            })
        }
    }
}
