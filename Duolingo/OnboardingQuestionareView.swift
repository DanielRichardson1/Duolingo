//
//  OnboardingQuestionareView.swift
//  Duolingo
//
//  Created by Daniel Richardson on 12/30/24.
//

import SwiftUI

struct OnboardingQuestionareView: View {
    
    @State private var progress = 0.1
    @State private var index = 0
    @State private var selectedEntry = Array(1...Data.questions[0].answerImage.count).map{_ in false}
    
    @Environment(\.presentationMode) var presentationMode : Binding<PresentationMode>
    
    var body: some View {
        NavigationView{
            VStack(alignment: .leading){
                HStack{
                    Button(action: {
                        self.presentationMode
                            .wrappedValue.dismiss()
                    }) {
                        Image(systemName: "arrow.backward")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30)
                            .foregroundColor(.gray)
                    }.padding()
                    ZStack(alignment: .leading){
                        Rectangle()
                            .foregroundColor(Color.gray.opacity(0.3))
                            .frame(width:300, height:20)
                        Rectangle()
                            .foregroundColor(Color.green)
                            .frame(width:CGFloat(progress*300), height:20)
                            .cornerRadius(10)
                    }.cornerRadius(10)
                }
                    HStack{
                        Image("duoReading")
                            .resizable()
                            .scaledToFit()
                        ZStack{
                            SpeechBubble(cornerRadius: 20, isBottom: false, pointLocation: 20)
                                .fill(Color.green)
                            Text(Data.questions[index].query)
                                .font(.system(size: 20)).bold()
                                .foregroundColor(.white)
                                .padding()
                        }
                        .frame(width: 200, height: 100)
                        .padding()
                    }
                if index == 0 {
                    Text("For English speakers")
                        .font(.system(size: 25)).bold()
                        .foregroundColor(.black)
                        .padding()
                    
                }
                
            }
        }
    }
}

#Preview {
    OnboardingQuestionareView()
}
