import XCTest

import renderTests

var tests = [XCTestCaseEntry]()
tests += renderTests.allTests()
XCTMain(tests)
