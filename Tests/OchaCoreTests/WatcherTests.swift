//
//  WatcherTests.swift
//  OchaCoreTests
//
//  Created by Yudai.Hirose on 2019/03/01.
//

import XCTest
@testable import OchaCore

private let testURL = URL(fileURLWithPath: TestFile.file())
private let lineBreak = "\n"

class WatcherTests: XCTestCase {

    override func setUp() {
    }

    func testConfirmUtilityFunction() throws {
        let utility = Utility()
        let watcher = Watcher(paths: [testURL])

        let ext = self.expectation(description: #function)
        watcher.start({ (url) in
            XCTAssertEqual(testURL, url)
            ext.fulfill()
        })
        try utility.write(try utility.read() + " ")
        wait(for: [ext], timeout: 0.1)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
        }
    }

}

class Utility: XCTestCase {

    func read() throws -> String {
        return try String(contentsOf: testURL)
    }
    
    func write(_ content: String) throws {
        try content.write(to: testURL, atomically: true, encoding: .utf8)
    }
    
    func testUtilityFunctions() throws {
        let originalContent = try read()
        try write(originalContent + lineBreak)
        XCTAssertNotEqual(originalContent, try read())
        XCTAssertEqual(originalContent + lineBreak, try read())

        var addedLineBreakContent = try read()
        addedLineBreakContent.removeLast(lineBreak.count)
        try write(addedLineBreakContent)
        XCTAssertNotEqual(addedLineBreakContent, originalContent + lineBreak)
        XCTAssertEqual(originalContent, try read())
    }
}
