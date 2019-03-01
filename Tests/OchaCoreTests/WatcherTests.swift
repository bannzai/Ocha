//
//  WatcherTests.swift
//  OchaCoreTests
//
//  Created by Yudai.Hirose on 2019/03/01.
//

import XCTest

class WatcherTests: XCTestCase {

    override func setUp() {
    }

    let url = URL(fileURLWithPath: TestFile.file())
    let lineBreak = "\n"
    
    func read() throws -> String {
        return try String(contentsOf: url)
    }
    func write(_ content: String) throws {
        try content.write(to: url, atomically: true, encoding: .utf8)
    }
    
    func testConfirmUtilityFunction() throws {
        let originalContent = try read()
        try write(originalContent + lineBreak)
        XCTAssertNotEqual(originalContent, try read())
        
        var addedLineBreakContent = try read()
        addedLineBreakContent.removeLast(lineBreak.count)
        try write(addedLineBreakContent)
        XCTAssertEqual(originalContent, try read())
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
        }
    }

}
