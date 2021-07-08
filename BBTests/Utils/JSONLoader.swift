//
//  JSONLoader.swift
//  BB
//
//  Created by Otávio Zabaleta on 08/07/2021.
//

import Foundation

class JSONLoader {
    static func loadJson<T: Decodable>(_ filename: String) throws -> T {
        let file = Bundle(for: Self.self).url(forResource: filename, withExtension: "json")!
        return try JSONDecoder().decode(T.self, from: try Data(contentsOf: file))
    }
}

extension JSONLoader {
    static func characters() throws -> [Character] { try loadJson("SampleCharacters") }
//    static func weights() throws -> [Weight] { try loadJson("SampleWeights") }
}
