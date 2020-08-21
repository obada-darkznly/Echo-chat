//
//  Message+CoreDataProperties.swift
//  Echo-chat
//
//  Created by Obada on 8/21/20.
//  Copyright © 2020 Obada. All rights reserved.
//
//

import Foundation
import CoreData


extension Message {

    @nonobjc public class func createFetchRequest() -> NSFetchRequest<Message> {
        return NSFetchRequest<Message>(entityName: "Message")
    }

    @NSManaged public var text: String?
    @NSManaged public var date: Date?
    @NSManaged public var friend: Friend?

}
