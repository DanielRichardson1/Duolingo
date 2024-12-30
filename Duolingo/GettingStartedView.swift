//
//  GettingStartedView.swift
//  Duolingo
//
//  Created by Daniel Richardson on 12/29/24.
//

import SwiftUI

struct GettingStartedView: View {
    var body: some View {
        NavigationView{
            VStack {
                VStack {
                    Image(Images.gettingStartedImage)
                        .resizable()
                        .scaledToFit()
                    Text("Learn for Free. Forever")
                        .bold()
                }.padding()
                VStack {
                    NavigationLink(destination: OnboardingView()){
                        Text("Get Started")
                            .font(.system(size:20))
                            .bold()
                            .foregroundColor(.white)
                            .padding(EdgeInsets(top: 16, leading: 100, bottom: 16, trailing: 100))
                            .background(Color.green)
                            .cornerRadius(10)
                    }
                    Button(action: {}){
                        Text("I Already have an Account")
                            .font(.system(size:18))
                            .bold()
                            .foregroundColor(.green)
                            .padding(EdgeInsets(top: 16, leading: 45, bottom: 16, trailing: 45))
                            .background(Color.white)
                            .cornerRadius(10)
                    }.overlay (
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color .green, lineWidth: 2)
                    )
                }.padding(.top, 150)
            }
        }.navigationBarBackButtonHidden(true)
    }
}

#Preview {
    GettingStartedView()
}
