//
//  Codable.swift
//  Echo-chat
//
//  Created by Obada on 8/23/20.
//  Copyright © 2020 Obada. All rights reserved.
//

import Foundation


public extension Encodable {
    func hasKey(for path: String) -> Bool {
        return dictionary?[path] != nil
    }
    func value(for path: String) -> Any? {
        return dictionary?[path]
    }
    
    var dictionary: [String: Any]? {
        guard let data = try? JSONEncoder().encode(self) else { return nil }
        return (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)).flatMap { $0 as? [String: Any] }
    }
    
    func encode() throws -> Data {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        return try encoder.encode(self)
    }
    
}

/// Decodable objects
public extension Decodable {
    static func decode(data: Data) throws -> Self {
        let decoder = JSONDecoder()
        return try decoder.decode(Self.self, from: data)
    }
}
