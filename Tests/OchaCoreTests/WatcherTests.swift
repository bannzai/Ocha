//
//  WatcherTests.swift
//  OchaCoreTests
//
//  Created by Yudai.Hirose on 2019/03/01.
//

import XCTest
@testable import OchaCore

private let lineBreak = "\n"

class WatcherTests: XCTestCase {

    private let url = TestFile.file()
    func testConfirmUtilityFunction() throws {
        let utility = Utility()
        let watcher = Watcher(paths: [url])

        let ext = self.expectation(description: #function)
        watcher.start({ (events) in
            XCTAssertEqual(events.count, 1)
            ext.fulfill()
        })
        
        try utility.write(try utility.read() + " ")
        
        wait(for: [ext], timeout: 1)
        
        watcher.stop()
        watcher.release()
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
        }
    }

}

class Utility: XCTestCase {
    private let url = URL(fileURLWithPath: TestFile.file())
    func read() throws -> String {
        return try String(contentsOf: url)
    }
    
    func write(_ content: String) throws {
        try content.write(to: url, atomically: true, encoding: .utf8)
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
