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
        answerSubText: ["Casual", "Regular", "Serious", "Intense"]
    ),
    Question(
        query: "That's 25 words in your first week",
        answerImage: [],
        answerText: [],
        answerSubText: []
    ),
    Question(
        query: "I'll remind you to practice so that it become a habit!",
        answerImage: [],
        answerText: [],
        answerSubText: []
    ),
    Question(
        query: "Here is what you can achieve in 3 months",
        answerImage: ["chat","flashCards","watch"],
        answerText: ["Converse with confidence","Build up your vocabulary","Develop a learning habit"],
        answerSubText: ["Stress-free speaking and listening exercise","Common words and practical phrases","Smart reminders, fun challenges and more"]
    ),
    Question(
        query: "Where would you like to start?",
        answerImage: ["notebook","compass"],
        answerText: ["Start from scratch","Find my level"],
        answerSubText: ["Take the easiest lesson of selected Language","Let Duo Recommend where you should start learning"]
    )
    ]
}

struct LessonsData {
    static let lessons = [
        Lessons(type: .wordWithSound,
                question: "は",
                questionInJapanse: "は",
                japaneseOptions: [],
                options: ["ha", "shi", "i"],
                correctOptionIndex: 0,
                correctMatchIndices: []),
        Lessons(type: .onlyText,
                question: "bi",
                questionInJapanse: "び",
                japaneseOptions: ["び", "じ", "ぽ", "の"],
                options: [],
                correctOptionIndex: 0,
                correctMatchIndices: []),
        Lessons(type: .onlySound,
                question: "あ",
                questionInJapanse: "あ",
                japaneseOptions: [],
                options: ["お", "あ", "い", "わ"],
                correctOptionIndex: 1,
                correctMatchIndices: []),
        Lessons(type: .matchingPairs,
                question: "",
                questionInJapanse: "",
                japaneseOptions: ["あ", "い", "え", "お", "う"],
                options: ["i", "e", "u", "a", "o"],
                correctOptionIndex: 1,
                correctMatchIndices: [[0, 3], [1, 0], [2, 1], [3, 4], [4, 2]])
        
    ]
}
