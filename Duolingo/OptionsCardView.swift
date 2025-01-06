//
//  OptionsCardView.swift
//  Duolingo
//
//  Created by Daniel Richardson on 1/5/25.
//

import SwiftUI

struct OptionsCardView: View {
    
    var index : Int = 0
    var selectionObject : OptionSelectionHandler = OptionSelectionHandler()
    var word : String = "poo"
    var type : LessonType = .wordWithSound
    
    
    var body: some View {
        Button(action: {}) {
            
        }
        ZStack{
            Text(word)
                .font(.system(size:30))
                .foregroundColor(.black)
                .bold()
                .multilineTextAlignment(.leading)
            if type == .wordWithSound {
                RoundedRectangle(cornerRadius:20)
                    .stroke(selectionObject.selectedEntry[index] ? .green : .gray, lineWidth:2)
            }
                
        }
    }
}


#Preview {
    OptionsCardView()
}
