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
    
    @StateObject var viewModel = OnboardingViewModel()
    
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
                ScrollView {
                    VStack{
                        ForEach(0..<viewModel.question.answerText.count,id:\.self){
                            i in SelectionCardView(question: $viewModel.question, queryIndex: index, selectedEntry: $selectedEntry, selectedIndex: i )
                        }
                    }
                }
                Spacer()
                
                Button(action: {
                    if(index<5) {
                        index = index + 1
                        viewModel.getQuestionAtIndex(index:index)
                        if Data.questions[index].answerText.count > 0 {
                            selectedEntry = []
                            selectedEntry = Array(1...Data.questions[0].answerImage.count).map{_ in false}
                            progress = CGFloat((index+1)/Data.questions.count)
                        }
                    }
                }){
                    Text("Continue")
                        .font(.system(size: 20))
                        .bold()
                        .foregroundColor(.white)
                        .padding(EdgeInsets(top: 16, leading: 100, bottom: 16, trailing: 100))
                        .background(isEnableContinueButton() ? Color.green : Color.gray)
                        .cornerRadius(10)
                }.padding(.leading, 50)
                    .disabled(!isEnableContinueButton())
            }
        }
        .navigationBarBackButtonHidden(true)
    }
    
    func isEnableContinueButton() -> Bool{
        for i in 0..<selectedEntry.count {
            if selectedEntry[i] {
                return true
            }
        }
        return false
    }
}
    #Preview {
        OnboardingQuestionareView()
    }
