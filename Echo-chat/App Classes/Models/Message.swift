//
//  Message.swift
//  Echo-chat
//
//  Created by Obada on 8/23/20.
//  Copyright © 2020 Obada. All rights reserved.
//

import Foundation


class Message: Codable{
    var text: String?
    var timeStamp: Date?
    var isMe: Bool?
    
    enum CodingKeys: String, CodingKey {
        case text
        case timeStamp
        case isMe
    }
    
    init(withText text: String, timeStamp: Date, andisMe isMe: Bool) {
        self.text = text
        self.timeStamp = timeStamp
        self.isMe = isMe
    }
    
    required init(from decoder: Decoder) throws {
        do {
           let container = try decoder.container(keyedBy: CodingKeys.self)
            text = try container.decodeIfPresent(String.self, forKey: .text) ?? ""
            timeStamp = try container.decodeIfPresent(Date.self, forKey: .timeStamp) ?? Date()
            isMe = try container.decodeIfPresent(Bool.self, forKey: .isMe) ?? false
        } catch {
            
        }
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(text, forKey: .text)
        try container.encode(timeStamp, forKey: .timeStamp)
        try container.encode(isMe, forKey: .isMe)
    }
}
