//
//  Lessons.swift
//  Duolingo
//
//  Created by Daniel Richardson on 1/4/25.
//

import Foundation

enum LessonType {
    case wordWithSound
    case onlySound
    case matchingPairs
    case onlyText
}

struct Lessons {
    let type : LessonType
    let question : String
    let questionInJapanse : String
    let japaneseOptions : [String]
    let options : [String]
    let correctOptionIndex : Int
    let correctMatchIndices : [[Int]]
    
}
