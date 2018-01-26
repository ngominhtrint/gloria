//
//  TopicService.swift
//  Gloria
//
//  Created by TriNgo on 1/26/18.
//  Copyright © 2018 TriNgo. All rights reserved.
//

import Foundation

protocol TopicService {
    
    func fetchTopic(callback: ((TopicServiceResult) -> Void)?)
}

struct TopicServiceResult {
    
    var topics: TopicList?
    var error: TopicServiceError?
}

enum TopicServiceError: Error {
    
    case failedToFetchTopics(message: String)
    
    var message: String {
        switch self {
        case .failedToFetchTopics(let message):
            return message
        }
    }
}

