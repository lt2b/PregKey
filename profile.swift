//
//  profile.swift
//  Axxess
//
//  Created by Arrio Gonsalves on 4/2/23.
//

import Foundation
import SwiftUI

struct Profile: View {
    var body: some View {
        NavigationView{
            ScrollView {
            Spacer()
                Image("profilePicture")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 350, height: 350)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 5))
                    .shadow(radius: 10)
                Text("Jane Doe")
                    .font(.largeTitle)
                    .padding(.top, 20)
                Text("Patient ID: 123456")
                    .font(.headline)
                    .foregroundColor(.gray)
                Text("Phone: 123-456-7890")
                    .font(.headline)
                    .foregroundColor(.gray)
                Text("Email: jane.doe@gmail.com")
                    .font(.headline)
                    .foregroundColor(.gray)
                Spacer()
                Text("Provider Name: Dr. John Fancy")
                    .font(.headline)
                    .foregroundColor(.gray)
                Text("Provider Phone: 888-567-908")
                    .font(.headline)
                    .foregroundColor(.gray)
                Text("Email: john.fancy@totalhealth.com")
                    .font(.headline)
                    .foregroundColor(.gray)
            }
            .navigationTitle("Profile")
            .navigationBarItems(trailing:
                           Button(action: {
                               // handle edit button action here
                           }, label: {
                               Image(systemName: "pencil")
                           })
                       )
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.white)
        }
    }
}




struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        //ContentView()
        Profile()
    }
}
