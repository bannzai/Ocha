//
//  WatcherTests.swift
//  OchaTests
//
//  Created by Yudai.Hirose on 2019/03/01.
//

import XCTest
@testable import Ocha

class WatcherTests: XCTestCase {
    private let url = TestFile.file()
    
    func testWatcher() throws {
        let utility = Utility(urlString: url)
        let watcher = Watcher(paths: [url])

        let ext = self.expectation(description: #function)
        watcher.start({ (events) in
            XCTAssertEqual(events.count, 1)
            ext.fulfill()
        })
        
        let originalContent = try utility.read()
        try utility.write(originalContent + " ")
        
        wait(for: [ext], timeout: 1)
        
        watcher.stop()
        watcher.release()
        
        try utility.write(originalContent)
    }
}
