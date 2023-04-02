//
//  Login.swift
//  Axxess
//
//  Created by Arrio Gonsalves on 4/2/23.
//

import Foundation
import SwiftUI

struct LoginView: View {
    @State private var username = ""
    @State private var password = ""
    @State private var wrongUsername = false
    @State private var wrongPassword = false
    @State private var showingLoginScreen = false
    @State private var showProviderScreen = false;
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(.sRGB, red: 213/255, green: 0, blue: 0, opacity: 0.25)
                    .ignoresSafeArea()
                Circle()
                    .scale(1.7)
                    .foregroundColor(Color(red: 213/255, green: 41/255, blue: 65/255))
                Circle()
                    .scale(1.35)
                    .foregroundColor(.white)
                VStack {
                    Text("PregKey")
                        .font(Font.custom("Avenir-Medium", size: 80))
                        .bold()
                        .foregroundColor(Color(red: 213/255, green: 41/255, blue: 65/255))
                        .padding()
                    Text("Login")
                        .font(.title)
                        .bold()
                        .padding()
                    TextField("Username", text: $username)
                        .padding()
                        .bold()
                        .frame(width: 300, height: 50)
                        .background(Color(red: 213/255, green: 0, blue: 0).opacity(0.05))
                        .cornerRadius(10)
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(wrongUsername ? Color.red : Color.clear, lineWidth: 2))
                    
                    SecureField("Password", text: $password)
                        .padding()
                        .bold()
                        .frame(width: 300, height: 50)
                        .background(Color(red: 213/255, green: 0, blue: 0).opacity(0.05))
                        .cornerRadius(10)
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(wrongPassword ? Color.red : Color.clear, lineWidth: 2))
                    
                    Button("Patient Login") {
                        authenticateUser(username: username, password: password)
                    }
                    .foregroundColor(.black)
                    .bold()
                    .frame(width: 300, height: 50)
                    .background(Color(red: 213/255, green: 41/255, blue: 65/255).opacity(0.55))
                    .cornerRadius(10)
                    
                    Button("Provider Login") {
                        authenticateProvider(username: username, password: password)
                    }
                    .foregroundColor(.black)
                    .bold()
                    .frame(width: 300, height: 50)
                    .background(Color(red: 213/255, green: 41/255, blue: 65/255).opacity(0.55))
                    .cornerRadius(10)
                }
            }
            .navigationBarHidden(true)
            .background(
                NavigationLink(
                    destination: ContentView(),
                    isActive: $showingLoginScreen
                ) {
                    EmptyView()
                }
            )
            .navigationBarHidden(true)
            .background(
              NavigationLink(
                    destination: ProviderView(),
                    isActive: $showProviderScreen
                 ) {
                      EmptyView()
                    }
                )
        }
    }
    
    func authenticateUser(username: String, password: String) {
        if username.lowercased() == "janedoe" {
            wrongUsername = false
            if password.lowercased() == "abc123" {
                wrongPassword = false
                showingLoginScreen = true
            } else {
                wrongPassword = true
            }
        } else {
            wrongUsername = true
        }
    }
    
    func authenticateProvider(username: String, password: String) {
        if username.lowercased() == "johnfancy" {
            wrongUsername = false
            if password.lowercased() == "abc123" {
                wrongPassword = false
                showProviderScreen = true
            } else {
                wrongPassword = true
            }
        } else {
            wrongUsername = true
        }
    }
}

struct ProviderView: View {
    @State private var text = ""
    
    var body: some View {
        VStack {
                   TextField("Beta HCG", text: $text)
                       .textFieldStyle(RoundedBorderTextFieldStyle())
                       .padding()
               }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
