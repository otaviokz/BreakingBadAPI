//
//  Character.swift
//  BB
//
//  Created by Otávio Zabaleta on 08/07/2021.
//

import Foundation

enum CharacterStatus: String, Codable {
    case alive = "Alive"
    case deceased = "Deceased"
    case presumedDead = "Presumed dead"
    case unknown = "Unknown"
    
    public init(rawValue: String) {
        switch rawValue.lowercased() {
        case CharacterStatus.alive.rawValue.lowercased():
            self = .alive
        case CharacterStatus.deceased.rawValue.lowercased():
            self = .deceased
        case CharacterStatus.presumedDead.rawValue.lowercased():
            self = .presumedDead
        default:
            self = .unknown
        }
    }
}

struct Character: Codable {
    private static var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM-dd-yyyy"
        return formatter
    }()
    
    let name: String
    let birthday: Date?
    let occupation: [String]
    private(set) var imageUrl: URL?
    private(set) var status: CharacterStatus = .unknown
    let nickname: String?
    let appearance: [Int]
    let portrayed: String?
    let bcsAppearance: [Int]
    
    private enum CodingKeys: String, CodingKey {
        case name, birthday, occupation, status, nickname, appearance, portrayed
        case imageUrl = "img"
        case bcsAppearance = "better_call_saul_appearance"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Character.CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        let dateString = try container.decodeIfPresent(String.self, forKey: .birthday) ?? ""
        birthday = Self.dateFormatter.date(from: dateString)
        occupation = try container.decodeIfPresent([String].self, forKey: .occupation) ?? []
        if let imageUrlString = try container.decodeIfPresent(String.self, forKey: .imageUrl) {
            imageUrl = URL(string: imageUrlString)
        }
        if let statusString = try container.decodeIfPresent(String.self, forKey: .status) {
            status = CharacterStatus(rawValue: statusString)
        }
        nickname = try container.decodeIfPresent(String.self, forKey: .nickname)
        appearance = try container.decodeIfPresent([Int].self, forKey: .appearance) ?? []
        portrayed = try container.decodeIfPresent(String.self, forKey: .portrayed)
        bcsAppearance = try container.decodeIfPresent([Int].self, forKey: .bcsAppearance) ?? []
    }
}
