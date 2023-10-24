//
//  PropertyWapperTests.swift
//  QueraTests
//
//  Created by hamedpouramiri on 10/24/23.
//

import XCTest
import Quera

final class PropertyWapperTests: XCTestCase {

    func test_PersonModel_OnNotValidPasswordSetEmpty() {
        let sut = Person(name: "Ali", password: "123456")
        XCTAssertEqual(sut.password, "")
    }

    func test_PersonModel_OnValidPasswordSetPassword() {
        let password = "Ali@123456"
        let sut = Person(name: "Ali", password: password)
        XCTAssertEqual(sut.password, password)
    }

    func test_PersonModel_convertNameToLowercase() {
        let sut1 = Person(name: "ALI", password: "any password")
        let sut2 = Person(name: "AlI", password: "any password")
        let sut3 = Person(name: "aLI", password: "any password")
        
        XCTAssertEqual(sut1.name, "ali")
        XCTAssertEqual(sut2.name, "ali")
        XCTAssertEqual(sut3.name, "ali")
    }

}
