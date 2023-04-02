//
//  ContentView.swift
//  mainAxxess
//
//  Created by shaurya on 4/2/23.
//

import SwiftUI
import CoreData

struct ContentView: View {

    var body: some View {
        TabView{
            HomePage(userName: "Mrs. Dwivedi")
                .tabItem{
                    Image(systemName: "house")
                    Text("Home")
                }
//            HealthView()
//                .tabItem{
//                    Image(systemName: "heart")
//                    Text("Health")
//                }
            Profile()
                .tabItem{
                    Image(systemName: "person.circle.fill")
                    Text("Profile")
                }
        }
        }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
