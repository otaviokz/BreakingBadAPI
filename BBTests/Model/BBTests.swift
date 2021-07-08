//
//  CharacterTest.swift
//  BBTests
//
//  Created by Otávio Zabaleta on 08/07/2021.
//

import XCTest
@testable import BB

class CharacterTest: XCTestCase {
    private lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM-dd-yyyy"
        return formatter
    }()
    
    func testLoadFromSampleDatza() throws {
        let chars = try! JSONLoader.characters()
        XCTAssertEqual(chars.count, 63)
        
        let sample: [Character] = [chars[11], chars[0], chars[57]]
        XCTAssertEqual(sample.map { $0.name }, ["Tuco Salamanca", "Walter White", "Kimberly Wexler"])
        XCTAssertEqual(sample.map { $0.birthday }, [nil, dateFormatter.date(from: "09-07-1958"), nil])
        XCTAssertEqual(sample.map { $0.occupation }, occupations)
        XCTAssertEqual(sample.map { $0.imageUrl }, imageURLs)
        XCTAssertEqual(sample.map { $0.status }, [.deceased, .presumedDead, .unknown])
        XCTAssertEqual(sample.map { $0.nickname }, ["Tuco", "Heisenberg", "Kim"])
        XCTAssertEqual(sample.map { $0.appearance }, [[1, 2], [1, 2, 3, 4, 5], []])
        XCTAssertEqual(sample.map { $0.portrayed }, ["Raymond Cruz", "Bryan Cranston", "Rhea Seehorn"])
        XCTAssertEqual(sample.map { $0.bcsAppearance }, [[1, 2], [], [1, 2, 3, 4]])
    }
}

private extension CharacterTest {
    var occupations: [[String]] {
        [["Meth Distributor"], ["High School Chemistry Teacher", "Meth King Pin"], ["Lawyer"]]
    }
    
    var imageURLs: [URL] {
        [URL(string: "vignette.wikia.nocookie.net/breakingbad/images/a/a7/Tuco_BCS.jpg")!,
         URL(string: "images.amcnetworks.com/amc.com/wp-content/uploads/2015/04/cast_bb_700x1000_walter-white-lg.jpg")!,
         URL(string: "vignette.wikia.nocookie.net/breakingbad/images/f/f7/BCS_S4_Kim_Wexler.jpg")!]
    }
}
