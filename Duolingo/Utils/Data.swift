//
//  Data.swift
//  Duolingo
//
//  Created by Daniel Richardson on 12/30/24.
//
// We are using static data for this offline app, but normally this would be loaded from server

import Foundation

struct Data {
    static let questions : [Question] = [
    Question(
        query: "What would you like to learn?",
        answerImage: ["spain", "france", "germany", "italy", "japan", "china", "russia", "south-korea", "portugal", "arabic"],
        answerText: ["Spanish", "French", "German", "Italian", "Japanese", "Chinese", "Russian", "Korean", "Portugese", "Arabic"],
        answerSubText: []
    ),
    Question(
        query: "How did you hear about Duolingo?",
        answerImage: [],
        answerText: ["Friends/Family", "Facebook/Instagram", "Tiktok", "Appstore", "Youtube", "TV", "Google Search", "News/Article/Blog"],
        answerSubText: []
    ),
    Question(
        query: "How much of this language do you know?",
        answerImage: ["graph1", "graph2", "graph3", "graph4"],
        answerText: ["I'm new to this language", "I know some words or phrases", "I can have simple conversations", "I am intermediate or higher"],
        answerSubText: []
    ),
    Question(
        query: "What's your daily learning goal?",
        answerImage: [],
        answerText: ["5 min/day", "10 min/day", "15 min/day", "20 min/day"],
        answerSubText: ["Casual", "Regular", "Serious", "Intenes"]
    )
    ]
}
