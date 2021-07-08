//
//  Localize.swift
//  BB
//
//  Created by Otávio Zabaleta on 08/07/2021.
//

import Foundation

func localize(_ key: LocalizationKey, bundle: Bundle = Bundle.main) -> String {
    NSLocalizedString(key.rawValue, bundle: bundle, comment: "")
}

enum LocalizationKey: String {
    case main_characters
}
