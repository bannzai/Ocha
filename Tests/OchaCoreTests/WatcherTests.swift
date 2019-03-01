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
    func read() throws -> String {
        return try String(contentsOf: url)
    }
    func testExample() throws {
        let originalContent = try read()
        try (originalContent + "\n").write(to: url, atomically: true, encoding: .utf8)
        
        XCTAssertNotEqual(originalContent, try read())
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
        }
    }

}
