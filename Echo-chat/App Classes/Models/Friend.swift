//
//  Friend.swift
//  Echo-chat
//
//  Created by Obada on 8/23/20.
//  Copyright © 2020 Obada. All rights reserved.
//

import Foundation



class Friend: Codable {
    
    var firstName: String?
    var lastName: String?
    var messages: [Message]?
    var profileImageString: String?
    
    enum CodingKeys: String, CodingKey {
        case firstName
        case lastName
        case messages
        case profileImageString
    }
    
    init(withFirstName firstName: String, lastName: String, messages: [Message]?, andProfileImageString profileImageString: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.messages = messages
        self.profileImageString = profileImageString
    }
    
    required init(from decoder: Decoder) throws {
        do {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            firstName = try container.decodeIfPresent(String.self, forKey: .firstName) ?? ""
            lastName = try container.decodeIfPresent(String.self, forKey: .lastName) ?? ""
            messages = try container.decodeIfPresent([Message].self, forKey: .messages)
            profileImageString = try container.decodeIfPresent(String.self, forKey: .profileImageString)
        } catch {
            
        }
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(firstName, forKey: .firstName)
        try container.encode(lastName, forKey: .lastName)
        try container.encode(messages, forKey: .messages)
        try container.encode(profileImageString, forKey: .profileImageString)
    }
}
