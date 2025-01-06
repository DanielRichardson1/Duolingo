//
//  QuestionCardView.swift
//  Duolingo
//
//  Created by Daniel Richardson on 1/5/25.
//

import SwiftUI

struct QuestionCardView: View {
    
    var word : String
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: 200, height: 200)
                .foregroundColor(.green)
                .cornerRadius(10)
            Text(word)
                .foregroundColor(.white)
                .font(.system(size:100))
        }
    }
}

#Preview {
    QuestionCardView(word: "は")
}
