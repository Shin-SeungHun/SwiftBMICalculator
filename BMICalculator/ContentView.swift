//
//  ContentView.swift
//  BMICalculator
//
//  Created by 신승훈 on 2024/04/04.
//

import SwiftUI

struct ContentView: View {
    @State private var height: String = ""
    @State private var weight: String = ""
    @State private var isShowingResult: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Height (cm)", text: $height)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                TextField("Weight (kg)", text: $weight)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button(action: {
                    isShowingResult = true
                }) {
                    Text("계산")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .sheet(isPresented: $isShowingResult, content: {
                    ResultView(height: Double(height) ?? 0, weight: Double(weight) ?? 0)
                })
                
                Spacer()
            }
            .padding()
            .navigationTitle("BMI Calculator")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        }
    }
}

#Preview {
    ContentView()
}
