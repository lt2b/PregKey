//
//  ContentView.swift
//  Axxess
//
//  Created by Arrio Gonsalves on 4/1/23.
//

import SwiftUI


struct ContentView: View {
    var body: some View {
        TabView{
            HomeView(userName: "Jane")
                .tabItem{
                    Image(systemName: "house")
                    Text("Home")
                }
            HealthView()
                .tabItem{
                    Image(systemName: "heart")
                    Text("Health")
                }
            ProfileView()
                .tabItem{
                    Image(systemName: "person.circle.fill")
                    Text("Profile")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
