//
//  LessonView.swift
//  Duolingo
//
//  Created by Daniel Richardson on 1/3/25.
//

import SwiftUI
import AVFoundation

struct LessonView: View {
    
    @State private var progress = 0.1
    @Environment(\.presentationMode) var presentationMode : Binding<PresentationMode>
    let lessonsData = LessonsData.lessons
    @State var indexLesson : Int = 2
    @ObservedObject var selectionHandler = OptionSelectionHandler()
    @State var gridItems = [GridItem(.flexible(), alignment:.center)]
    @State private var speechSynthesizer : AVSpeechSynthesizer?
    @State private var displayResultView : Bool = false
    @State var result : Result = Result(isCorrect: true, answer: "")
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading){
                
                HStack{
                    
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }){
                        Image(systemName: "xmark")
                            .resizable()
                            .scaledToFit()
                            .frame(width:30)
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
                
                let options = lessonsData[indexLesson].options.count > 0 ? lessonsData[indexLesson].options : lessonsData[indexLesson].japaneseOptions
                
                let text =
                switch(lessonsData[indexLesson].type){
                case LessonType.wordWithSound:
                    "What sound does this make?"
                case LessonType.onlyText:
                    "Select the correct letters for \(lessonsData[indexLesson].question)"
                case LessonType.onlySound:
                    "What do you hear?"
                default:
                    "Tap the matching pairs"
                }
                
                Text(text)
                    .font(.system(size:25))
                    .bold()
                    .foregroundColor(.black)
                    .padding(.leading, 10)
                
                Spacer().frame(height:50)
                
                HStack {
                    Spacer()
                    QuestionCardView(word: lessonsData[indexLesson].question, type: lessonsData[indexLesson].type)
                    Spacer()
                }
                
                ScrollView {
                    LazyVGrid(columns: gridItems){
                        Text("options")
                    }
                    
                }
            }
        }.navigationBarBackButtonHidden(true)
    }
}

#Preview {
    LessonView()
}
