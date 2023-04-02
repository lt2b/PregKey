//
//  homepage.swift
//  mainAxxess
//
//  Created by shaurya on 4/2/23.
//

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
                .scaledToFit()
        }
    }
}

struct HomePage: View {
    let userName: String
    
    var greeting: String {
        let hour = Calendar.current.component(.hour, from: Date())
        switch hour {
        case 6..<12:
            return "Good morning"
        case 12..<18:
            return "Good afternoon"
        default:
            return "Good evening"
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
            
            @State var babyProgress: String = ""
            
            ScrollView {
                LazyVStack(spacing: 20) {
                    VStack(){}
                    BoxComponent(title: "Baby Progress", description: "", image: "3months")
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
//                    TextField("Enter baby progress", text: $babyProgress)
//                                    .textFieldStyle(RoundedBorderTextFieldStyle())
//                }
            }
            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
    }
}


struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage(userName: "Arrio")
    }
}
