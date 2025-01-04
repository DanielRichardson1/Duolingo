//
//  OptionsResultView.swift
//  Duolingo
//
//  Created by Daniel Richardson on 1/4/25.
//

import SwiftUI

struct OptionsResultView: View {
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Image(systemName: "checkmark.circle.fill")
                    .foregroundColor(Color.green)
                Text("Great Job!")
                    .foregroundColor(Color.green)
                    .font(.system(size:20))
                    .bold()
                Spacer()
                Button(action: {}){
                    Image(systemName: "flag")
                        .frame(width:50, height:50)
                        .foregroundColor(Color.green)
                        .bold()
                        .scaleEffect(x:-1,y:1)
                }
            }
            Spacer()
        }.padding()
            .frame(width: UIScreen.main.bounds.width, height:200)
            .background(Color.yellow)
        
    }
}

#Preview {
    OptionsResultView()
}
