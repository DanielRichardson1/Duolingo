//
//  OnboardingViewModel.swift
//  Duolingo
//
//  Created by Daniel Richardson on 1/1/25.
//
// For online app this would be fetched from the server

import Foundation

class OnboardingViewModel : ObservableObject {
    @Published var question : Question
    var index : Int
    
    init() {
        question = Question(query: "", answerImage: [], answerText: [], answerSubText: [])
        index = 0
        self.getQuestionAtIndex(index: index)
    }
    
    func getQuestionAtIndex(index: Int) {
        question = Data.questions[index]
    }
}
