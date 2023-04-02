//
//  helper.swift
//  mainAxxess
//
//  Created by shaurya on 4/2/23.
//

import SwiftUI

struct OnBoardingHelperView: View {
    
    @State private var selection: Int = 0
    
    var body: some View {
        TabView(selection:$selection){
            OnboardingView(selection: .constant(0), title: "Pregnancy Care", subtitle: "Providing healthcare for pregnant people!", image: Constants.onboarding3.rawValue, buttonTitle: "Continue")
                .transition(.asymmetric(insertion: .move(edge: .leading), removal: .move(edge: .trailing)))
                .tag(0)
            
            OnboardingView(selection:  $selection, title: "Care in your hands", subtitle: "Request help or assistance whenever wherever!", image: Constants.onboarding2.rawValue, buttonTitle: "Get Started")
                .transition(.asymmetric(insertion: .move(edge: .leading), removal: .move(edge: .trailing)))
                .tag(1)
            
        }.tabViewStyle(PageTabViewStyle())
            .indexViewStyle(
                PageIndexViewStyle(backgroundDisplayMode: .always))
    }
}

struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingHelperView()
    }
}
