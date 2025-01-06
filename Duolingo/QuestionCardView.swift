//
//  QuestionCardView.swift
//  Duolingo
//
//  Created by Daniel Richardson on 1/5/25.
//

import SwiftUI

struct QuestionCardView: View {
    
    var word : String
    var type : LessonType
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: 200, height: 200)
                .foregroundColor(.green)
                .cornerRadius(10)
            if type == .onlySound {
                Image(systemName: "speaker.wave.2.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width:80, height:80)
                    .foregroundColor(.white)
                    .bold()
            }else {
                Text(word)
                    .foregroundColor(.white)
                    .font(.system(size:100))
            }
        }
    }
}

#Preview {
    QuestionCardView(word: "は", type: .onlySound)
}
