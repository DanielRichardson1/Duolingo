//
//  OptionsResultView.swift
//  Duolingo
//
//  Created by Daniel Richardson on 1/4/25.
//

import SwiftUI

struct OptionsResultView: View {
    
    var result : Result
    
    var body: some View {
        let isCorrect = result.isCorrect
        let color: Color = isCorrect ? .green : .red
        VStack(alignment: .leading){
            HStack{
                Image(systemName: isCorrect ? "checkmark.circle.fill" : "multiply.circle.fill" )
                    .foregroundColor(color)
                Text(isCorrect ? "Great Job!" : "Incorrect!")
                    .foregroundColor(color)
                    .font(.system(size:20))
                    .bold()
                Spacer()
                Button(action: {}){
                    Image(systemName: "flag")
                        .frame(width:50, height:50)
                        .foregroundColor(color)
                        .bold()
                        .scaleEffect(x:-1,y:1)
                }
            }
            
            if !isCorrect {
                Text("Correct Answer is \(result.answer)")
                    .foregroundColor(color)
                    .font(.system(size:20))
                    .bold()
            }
            Spacer()
            
        }.padding()
            .frame(width: UIScreen.main.bounds.width, height: isCorrect ? 200 : 300)
            .background(Color.yellow)
        
    }
}

//#Preview {
//    OptionsResultView()
//}
