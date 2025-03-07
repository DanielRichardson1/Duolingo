//
//  SelectionCardView.swift
//  Duolingo
//
//  Created by Daniel Richardson on 12/30/24.
//

import SwiftUI

struct SelectionCardView: View {
    @Binding var question : Question // usually would be @Binding
    var queryIndex : Int
    @Binding var selectedEntry : [Bool] // usually would be @Binding
    var selectedIndex : Int
    var body: some View {
        
        if queryIndex == 6 {
            if (selectedIndex < selectedEntry.count) {
                ZStack(alignment: .leading){
                    HStack{
                        if question.answerImage.count > 0 {
                            Image(question.answerImage[selectedIndex])
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50, height: 50)
                        } else {
                            Spacer()
                        }
                        Spacer()
                        VStack(alignment: .leading){
                            Text(question.answerText[selectedIndex])
                                .font(.system(size: 20))
                                .foregroundColor(.black)
                                .bold()
                            Spacer()
                            if question.answerSubText.count > 0 {
                                Text(question.answerSubText[selectedIndex])
                                    .font(.system(size: 15))
                                    .foregroundColor(.black)
                                    .bold()
                                }
                            }
                        }
                    
                }
            }
        }
        else {
            Button(action: {
                for i in 0..<selectedEntry.count {
                    selectedEntry[i] = false
                }
                selectedEntry[selectedIndex] = true
            }){
                if (selectedIndex < selectedEntry.count) {
                    ZStack(alignment: .leading){
                        HStack(spacing: 20){
                            if question.answerImage.count > 0 {
                                Image(question.answerImage[selectedIndex])
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 50, height: 50)
                                    .padding(.leading, 40)
                            } else {
                                Spacer()
                                    .frame(width:20)
                            }
                            if (queryIndex > 5) {
                                VStack(alignment: .leading){
                                    Text(question.answerText[selectedIndex])
                                        .font(.system(size: 20))
                                        .foregroundColor(.black)
                                        .bold()
                                    if (question.answerSubText.count > 0) {
                                        Text(question.answerSubText[selectedIndex])
                                            .font(.system(size: 15))
                                            .foregroundColor(.black)
                                            .bold()
                                            .multilineTextAlignment(.leading)
                                            .padding(.trailing, 20)
                                    }
                                }
                            }
                            else {
                                Text(question.answerText[selectedIndex])
                                    .font(.system(size: 20))
                                    .foregroundColor(.black)
                                    .bold()
                                    .multilineTextAlignment(.leading)
                                Spacer()
                                if question.answerSubText.count > 0 {
                                    Text(question.answerSubText[selectedIndex])
                                        .font(.system(size: 15))
                                        .foregroundColor(.black)
                                        .bold()
                                        .multilineTextAlignment(.trailing)
                                        .padding(.trailing, 50)
                                }
                            }
                        }
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(selectedEntry[selectedIndex] ? .green : .gray , lineWidth: 2)
                            .frame(width : 350 , height: 80)
                            .padding(.leading,20)
                            .disabled(!selectedEntry[selectedIndex])
                        
                    }
                }
            }
        }
    }
}
//#Preview {
////    SelectionCardView(queryIndex: 0, selectedIndex: 0)
//}
