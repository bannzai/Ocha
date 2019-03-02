//
//  Utility.swift
//  OchaTests
//
//  Created by Yudai.Hirose on 2019/03/02.
//

import Foundation
import XCTest
@testable import Ocha

let lineBreak = "\n"
class Utility {
    let url: URL
    init(url: URL) {
        self.url = url
    }
    init(urlString: String) {
        self.url = URL(fileURLWithPath: urlString)
    }

    func read() throws -> String {
        return try String(contentsOf: url)
    }
    
    func write(_ content: String) throws {
        try content.write(to: url, atomically: true, encoding: .utf8)
    }
}

class UtilityTests: XCTestCase {
    private let url = URL(fileURLWithPath: TestFile.file())
    private var utility: Utility!
    
    override func setUp() {
        super.setUp()
        
        utility = Utility(url: url)
    }
    
    private func read() throws -> String {
        return try utility.read()
    }
    
    private func write(_ content: String) throws {
        try utility.write(content)
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
