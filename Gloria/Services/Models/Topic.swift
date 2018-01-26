//
//  Topic.swift
//  Gloria
//
//  Created by TriNgo on 1/26/18.
//  Copyright © 2018 TriNgo. All rights reserved.
//

import Foundation
import Firebase

struct Topic {
    
    var id: String
    var describe: String
    var name: String
    var thumbnail: String
    
    init() {
        id = ""
        describe = ""
        name = ""
        thumbnail = ""
    }
}

extension Topic: SnapshotParser {
    
    init(with snapshot: DataSnapshot, exception: String...) {
        self.init()
        
        if snapshot.hasChild("id") && !exception.contains("id") {
            id = snapshot.childSnapshot(forPath: "id").value as! String
        }
        
        if snapshot.hasChild("describe") && !exception.contains("describe") {
            describe = snapshot.childSnapshot(forPath: "describe").value as! String
        }
        
        if snapshot.hasChild("name") && !exception.contains("name") {
            name = snapshot.childSnapshot(forPath: "name").value as! String
        }
        
        if snapshot.hasChild("thumbnail") && !exception.contains("thumbnail") {
            thumbnail = snapshot.childSnapshot(forPath: "thumbnail").value as! String
        }
    }
}

struct TopicList {
    
    var topics: [Topic]
    var count: Int {
        return topics.count
    }
    
    init() {
        topics = [Topic]()
    }
}
