//
//  DataStore.swift
//  Echo-chat
//
//  Created by Obada on 8/21/20.
//  Copyright © 2020 Obada. All rights reserved.
//

import Foundation
import Fakery


class DataStore: NSObject {
    
    // Singelton
    public static var shared: DataStore = DataStore()
    
    // MARK: Cache keys
    private let cacheKeyFriends = "CACHE_KEY_FRIENDS"
    
    // MARK: Temp data holders
    private var _friends: [Friend]?
    
    public override init() {
        super.init()
    }
    
    
    // MARK: Cached data
    var friends: [Friend]? {
        set {
            _friends = newValue
            do {
                let jsonData = try _friends.encode()
                if let jsonString = String(data: jsonData, encoding: .utf8) {
                    saveStringWithKey(stringToStore: jsonString, key: cacheKeyFriends)
                }
            } catch {
                
            }
        }
        get {
            if (_friends == nil) {
                do {
                    // decode the data to object
                    if let jsonData = loadStringForKey(key: cacheKeyFriends).data(using: .utf8) {
                        _friends = try [Friend].decode(data: jsonData)
                    }
                } catch {
                    
                }
            }
            return _friends
        }
    }
    
    // MARK: Caching methods
    
    /// Load string for key
    public func loadStringForKey(key:String) -> String {
        let storedString = UserDefaults.standard.object(forKey: key) as? String ?? ""
        return storedString;
    }
    
    /// Save string with key
    public func saveStringWithKey(stringToStore: String, key: String) {
        UserDefaults.standard.set(stringToStore, forKey: key);
        UserDefaults.standard.synchronize();
    }
}
