//
//  health.swift
//  Axxess
//
//  Created by Arrio Gonsalves on 4/2/23.
//

import Foundation
import SwiftUI

struct HealthView: View {
    var body: some View {
            NavigationView{
                    VStack(spacing: 20){
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color(red: 213/255, green: 41/255, blue: 65/255))
                                .frame(width: 350, height: 120)
                                .overlay(
                                    HStack(spacing: 2){
                                            Text("Systolic Blood Pressure: ")
                                                .font(.title)
                                                .foregroundColor(.white)
                                            Text("90")
                                                .font(.title)
                                                .fontWeight(.bold)
                                                .foregroundColor(.white)
                                        }
                                )
                                .padding(.vertical, 10)
                        
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color(red: 213/255, green: 41/255, blue: 65/255))
                            .frame(width: 350, height: 120)
                            .overlay(
                                HStack(spacing: 2){
                                    Text("Distolic Blood Pressure: ")
                                        .font(.title)
                                        .foregroundColor(.white)
                                    Text("120")
                                        .font(.title)
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                }
                            )
                            .padding(.vertical, 10)
                        
                        RoundedRectangle(cornerRadius: 20)
                                                  .fill(Color(red: 213/255, green: 41/255, blue: 65/255))
                                                  .frame(width: 350, height: 325)
                                                  .overlay(
                                                      VStack(spacing: 2){
                                                          Text("Beta HCG")
                                                              .font(.title)
                                                              .foregroundColor(.white)
                                                          Image("HCG")
                                                              .resizable()
                                                              .aspectRatio(contentMode: .fit)
                                                      }
                                                  )
                                                  .padding(.vertical, 10)
                    }
                    .padding(.bottom, 150)
                    .padding(.top, 150)
                    .frame(height: 500)
                    .navigationTitle("Patient Health")
            }
    }
}

struct HealthView_Previews: PreviewProvider {
    static var previews: some View {
        HealthView()
    }
}
