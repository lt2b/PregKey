//
//  home.swift
//  Axxess
//
//  Created by Arrio Gonsalves on 4/2/23.
//

import Foundation
import SwiftUI

struct BoxComponent: View {
    var title: String
    var description: String
    var image: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.black)
            Text(description)
                .font(.body)
                .foregroundColor(.black)
            Image(image)
                .resizable()
                
        }
    }
}

struct HomeView: View {
    let userName: String
    
    var greeting: String {
        let hour = Calendar.current.component(.hour, from: Date())
        switch hour {
        case 6..<12:
            return "Good Morning"
        case 12..<18:
            return "Good Afternoon"
        default:
            return "Good Evening"
        }
    }
    
    var body: some View {
        VStack(alignment: .leading){
            HStack(alignment: .center){
                Image("heartlogo")
                    .resizable()
                    .scaledToFill()
                    .clipped()
                    .frame(width: 50, height: 50)
                Text("PregKey")
                    .font(.custom("", size: (25)))
                    .foregroundColor(Color(red: 213/255, green: 41/255, blue: 65/255))
            }
            .frame(maxWidth: .infinity)
            VStack() {
                VStack(alignment: .leading) {
                    Text("\(greeting), ")
                        .font(.custom("", size: 36))
                    Text("\(userName)!")
                        .font(.custom("", size: 38))
                        .foregroundColor(Color(red: 213/255, green: 41/255, blue: 65/255))
                }.padding()
            }

//            VStack {
//                ZStack {
//                    Capsule()
//                        .fill(Color(red: 255/255, green: 194/255, blue: 207/255))
//                        .frame(height: 150)
//                    Text("Component Box")
//                        .font(.headline)
//                        .foregroundColor(.white)
//                }
//            }
//            .frame(maxWidth: .infinity, alignment: .center)
//            .padding()
            
            ScrollView {
                LazyVStack(spacing: 20) {
                    VStack(){}
                        BoxComponent(title: "Baby Progress", description: "", image: "")
                            .frame(height: 150)
                            .frame(width: 320)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10)
                            .shadow(radius: 2)
                        BoxComponent(title: "Weight Gain", description: "", image: "progresschart")
                            .frame(height: 150)
                            .frame(width: 320)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10)
                            .shadow(radius: 2)
                        BoxComponent(title: "Condition", description: "", image: "")
                            .frame(height: 150)
                            .frame(width: 320)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10)
                            .shadow(radius: 2)
                }
            }
            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(userName: "Jane")
    }
}
