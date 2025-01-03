//
//  OnboardingView.swift
//  Duolingo
//
//  Created by Daniel Richardson on 12/29/24.
//

import SwiftUI

struct OnboardingView: View {
    @State var index = 0
    @Environment(\.presentationMode) var presentationMode : Binding<PresentationMode>
    var body: some View {
        NavigationView{
            VStack{
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
                    Spacer()
                }.padding(.bottom, 80)
                ZStack{
                    SpeechBubble(cornerRadius: 20, isBottom: true, pointLocation: 50)
                        .fill(Color.green)
                    Text(Texts.onboardingText[index])
                        .font(.system(size: 20))
                        .bold()
                        .foregroundStyle(.white)
                        .padding()
                }.frame(width: index==0 ? 200 : 350, height: 100)
                Image(index%2 != 0 ?
                      Images.onBoardingImage1 :
                        Images.onBoardingImage2)
                .scaledToFit()
                if (index==1){
                    NavigationLink(destination: OnboardingQuestionareView(onboardingIndex: .constant(1))){
                        Text("Continue")
                            .font(.system(size:20))
                            .bold()
                            .foregroundColor(.white)
                            .padding(EdgeInsets(top: 16, leading: 100, bottom: 16, trailing: 100))
                            .background(Color.green)
                            .cornerRadius(10)
                            .padding(.top, 150)
                    }
                }
                else if (index == 3) {
                    // Move to lessons view
                }
                else {
                    Button(action: {
                        index += 1
                    } ) {
                        Text("Continue")
                            .font(.system(size:20))
                            .bold()
                            .foregroundColor(.white)
                            .padding(EdgeInsets(top: 16, leading: 100, bottom: 16, trailing: 100))
                            .background(Color.green)
                            .cornerRadius(10)
                            .padding(.top, 150)
                    }
                }
            }
        }.navigationBarBackButtonHidden(true)
    }
}

#Preview {
    OnboardingView()
}

struct SpeechBubble : Shape {
    let cornerRadius : CGFloat
    let isBottom : Bool
    let pointLocation : CGFloat
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.minX+cornerRadius, y: rect.minY))
        
        // top left corner
        path.addArc(center: CGPoint(x: rect.minX + cornerRadius, y: rect.minY + cornerRadius), radius: cornerRadius, startAngle: Angle(degrees: -90), endAngle: Angle(degrees: -180), clockwise: true)
        
        // little triangle at left
        if (!isBottom){
            path.addLine(to: CGPoint(x: rect.minX, y: rect.midY-10))
            path.addLine(to: CGPoint(x: rect.minX-10, y: rect.midY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.midY+10))
        }
        
        // left side
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY-cornerRadius))
        
        // bottom left corner
        path.addArc(center: CGPoint(x: rect.minX + cornerRadius, y: rect.maxY - cornerRadius), radius: cornerRadius, startAngle: Angle(degrees: 180), endAngle: Angle(degrees: 90), clockwise: true)
        
        // little triangle at bottom
        if (isBottom){
            path.addLine(to: CGPoint(x: pointLocation-10, y:rect.maxY))
            path.addLine(to: CGPoint(x: pointLocation, y:rect.maxY+10))
            path.addLine(to: CGPoint(x: pointLocation+10, y:rect.maxY))
        }

        // bottom right corner
        path.addArc(center: CGPoint(x: rect.maxX - cornerRadius, y: rect.maxY - cornerRadius), radius: cornerRadius, startAngle: Angle(degrees: 90), endAngle: Angle(degrees: 0), clockwise: true)
        
        // right side
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY+cornerRadius))
        
        // top right corner
        path.addArc(center: CGPoint(x: rect.maxX - cornerRadius, y: rect.minY+cornerRadius), radius: cornerRadius, startAngle: Angle(degrees: 0), endAngle: Angle(degrees: -90), clockwise: true)
        
        return path
    }
}
