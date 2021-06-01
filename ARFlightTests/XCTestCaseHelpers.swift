//
//  XCTestCaseHelpers.swift
//  ARFlightTests
//
//  Created by Wandianga hassane on 2021-06-01.
//

import XCTest

enum TestError: Error {
    case invalidResourceFilename
}

extension XCTest {
    
    func loadData(for filename: String) throws -> Data {
        let bundle = Bundle(for: type(of: self))
        
        guard let url = bundle.url(forResource: filename, withExtension: nil) else {
            throw TestError.invalidResourceFilename
        }
        
        return try Data(contentsOf: url)
    }
}
