//
//  OnboardingView.swift
//  mainAxxess
//
//  Created by shaurya on 4/2/23.
//

import SwiftUI

struct OnboardingView: View {
    
    @Binding var selection:Int
    let title:String
    let subtitle:String
    let image:String
    let buttonTitle:String
    
    @AppStorage("onboarding") var onboarding = false
    
    var body: some View {
        VStack {
            Spacer()
            Image(image)
                .resizable()
                .scaledToFit()
                .frame(width:240,height: 240)
            
            VStack(spacing:10) {
                Text(title)
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                
                Text(subtitle)
                    .font(.headline)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
                    .frame(maxWidth:.infinity)
                    .padding()
                
            }
            Spacer()
            VStack {
                Button(action: {
                    if selection == 0 {
                        withAnimation {
                            selection = 1
                        }
                    }else {
                        withAnimation {
                            onboarding = false
                        }
                    }
                }) {
                    Text(buttonTitle)
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(maxWidth:.infinity)
                        .padding()
                        .background(Color.btnColor.cornerRadius(10))
                        .shadow(radius: 10)
                        .padding()
                    
                }
                if selection == 0 {
                    Button(action: {
                        onboarding = false
                    }) {
                        Text("Skip")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundColor(.btnColor)
                            
                        
                    }
                }
            }
            Spacer()
        }
    }
}

struct OnbardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView(selection: .constant(0), title: "Pregnancy Care", subtitle: "Providing healthcare for pregnant people!", image: Constants.onboarding3.rawValue, buttonTitle: "Continue")
    }
}
