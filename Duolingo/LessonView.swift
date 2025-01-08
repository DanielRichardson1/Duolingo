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
    @State var indexLesson : Int = 0
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
                        ForEach(0..<options.count,id : \.self){ i in
                            OptionsCardView(index: i, selectionObject: selectionHandler, word: options[i], type: lessonsData[indexLesson].type)
                        }
                    }
                    
                }
                
                if displayResultView{
                    OptionsResultView(result: result)
                }
                
                Button(action: {
                    if(!displayResultView) {
                        if(selectionHandler.isSomeSelectedEntry){
                            displayResultView = true
                            let index = selectionHandler.indexOfEntrySelected
                            if(index == lessonsData[indexLesson].correctOptionIndex){
                                result.answer = ""
                                result.isCorrect = true
                            }
                            else {
                                result.answer = options[lessonsData[indexLesson].correctOptionIndex]
                                result.isCorrect = false
                            }
                        }
                    }
                        else {
                            displayResultView = false
                            result.isCorrect = true
                            indexLesson += 1
                            let options = lessonsData[indexLesson].options.count > 0 ? lessonsData[indexLesson].options : lessonsData[indexLesson].japaneseOptions
                            updateSelectionHandler(count: options.count)
                        }
                }){
                    Text(displayResultView ? "Continue" : "Check")
                        .font(.system(size:30))
                        .padding(EdgeInsets(top:10, leading:100, bottom:10, trailing:100))
                        .foregroundColor(.white)
                        .background(selectionHandler.isSomeSelectedEntry ? (result.isCorrect ? .green : .red) : .gray)
                        .cornerRadius(15)
                }.frame(width:UIScreen.main.bounds.width)
                    .disabled(!selectionHandler.isSomeSelectedEntry)
                
                
            }
            .onAppear{
                speakTheQuestion()
            }
        }.navigationBarBackButtonHidden(true)
    }
    
    func updateSelectionHandler(count: Int) {
        DispatchQueue.main.async {
            let _ = selectionHandler.updateObject(count: count)
            if lessonsData[indexLesson].type == .wordWithSound {
                gridItems = [GridItem(.flexible(), alignment: .center)]
            }
            else {
                gridItems = [GridItem(.flexible(), alignment: .center), GridItem(.flexible(), alignment: .center), ]
            }
            speakTheQuestion()
        }
    }
    
    func speakTheQuestion() {
        try? AVAudioSession.sharedInstance().setCategory(.playback)
        
        let utterance = AVSpeechUtterance(string: lessonsData[indexLesson].questionInJapanse)
        utterance.voice = AVSpeechSynthesisVoice(language:"ja")
        utterance.rate = 0.1
        
        speechSynthesizer = AVSpeechSynthesizer()
        speechSynthesizer?.speak(utterance)
        
        
    }
    
}
#Preview {
    LessonView()
}
