//
//  OptionsCardView.swift
//  Duolingo
//
//  Created by Daniel Richardson on 1/5/25.
//

import SwiftUI

struct OptionsCardView: View {
    
    var index : Int
    @ObservedObject var selectionObject : OptionSelectionHandler
    var word : String
    var type : LessonType
    
    
    var body: some View {
        Button(action: {
            selectionObject[index].toggle()
        }) {
            ZStack{
                Text(word)
                    .font(.system(size:30))
                    .foregroundColor(.black)
                    .bold()
                    .multilineTextAlignment(.leading)
                if type == .wordWithSound {
                    RoundedRectangle(cornerRadius:20)
                        .stroke(selectionObject.selectedEntry[index] ? .green : .gray, lineWidth:2)
                        .frame(width:UIScreen.main.bounds.width-20, height:80)
                        .padding([.leading, .trailing], 15)
                        .disabled(!selectionObject.selectedEntry[index])
                } else {
                    RoundedRectangle(cornerRadius:20)
                        .stroke(selectionObject.selectedEntry[index] ? .green : .gray, lineWidth:2)
                        .frame(width:150, height:150)
                        .padding([.leading, .trailing], 15)
                        .disabled(!selectionObject.selectedEntry[index])
                }
            }
        }
    }
}

#Preview {
    OptionsCardView(index: 0, selectionObject: OptionSelectionHandler(), word: "ha", type: .matchingPairs)
}
