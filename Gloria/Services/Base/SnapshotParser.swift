//
//  SnapshotParser.swift
//  Gloria
//
//  Created by TriNgo on 1/26/18.
//  Copyright © 2018 TriNgo. All rights reserved.
//

import Foundation
import Firebase

protocol SnapshotParser {
    
    init(with snapshot: DataSnapshot, exception: String...)
}
