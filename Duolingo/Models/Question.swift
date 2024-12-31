//
//  Question.swift
//  Duolingo
//
//  Created by Daniel Richardson on 12/30/24.
//

import Foundation

struct Question: Identifiable{
    let id = UUID().uuidString
    let query : String
    let answerImage : [String]
    let answerText : [String]
    let answerSubText : [String]
}
