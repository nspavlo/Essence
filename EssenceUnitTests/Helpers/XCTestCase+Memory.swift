//
//  XCTestCase+Memory.swift
//  EssenceUnitTests
//
//  Created by Jans Pavlovs on 06/02/2022.
//

import XCTest

extension XCTestCase {
    func trackForMemoryLeaks(
        _ instance: AnyObject,
        file: StaticString = #filePath,
        line: UInt = #line
    ) {
        addTeardownBlock { [weak instance] in
            let message = "Instance: \(String(describing: instance)) should have been deallocated."
            XCTAssertNil(instance, message, file: file, line: line)
        }
    }
}
