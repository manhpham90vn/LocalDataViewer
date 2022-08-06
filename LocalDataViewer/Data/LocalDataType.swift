//
//  LocalDataType.swift
//  LocalDataViewer
//
//  Created by Manh Pham on 8/6/22.
//

import Foundation
import KeychainAccess

enum LocalDataType: CustomStringConvertible {
    case userDefaults(item: UserDefaultType)
    case keychain(item: KeychainType)
    
    var description: String {
        switch self {
        case .userDefaults:
            return "UserDefaults \(name)"
        case .keychain:
            return "Keychain \(name)"
        }
    }
    
    var name: String {
        switch self {
        case let .userDefaults(item):
            return item.name
        case let .keychain(item):
            return item.name
        }
    }
    
    var items: [DetailValue] {
        switch self {
        case let .userDefaults(_items):
            return _items.items
        case let .keychain(_items):
            return _items.items
        }
    }
}

enum UserDefaultType {
    case standard(items: [DetailValue])
    case suiteName(name: String, items: [DetailValue])
    
    var items: [DetailValue] {
        switch self {
        case let .standard(items):
            return items
        case let .suiteName(_, items):
            return items
        }
    }
    
    var name: String {
        switch self {
        case .standard:
            return "standard"
        case let .suiteName(name, _):
            return name
        }
    }
}

enum KeychainType {
    case service(name: String, items: [DetailValue])
    
    var items: [DetailValue] {
        switch self {
        case let .service(_, items):
            return items
        }
    }
    
    var name: String {
        switch self {
        case let .service(name, _):
            return name
        }
    }
}
