//
//  mainAxxessApp.swift
//  mainAxxess
//
//  Created by shaurya on 4/2/23.
//

import SwiftUI

@main
struct mainAxxessApp: App {
    @AppStorage("onboarding") var onboarding = true
    var body: some Scene {
        WindowGroup {
            if onboarding {
                OnBoardingHelperView()
            }else {
                ContentView()
                    .onAppear {
                        NotificationManager.instances.requestAuthroization()
                    }
            }
        }
    }
}
