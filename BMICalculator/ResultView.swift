//
//  ResultView.swift
//  BMICalculator
//
//  Created by 신승훈 on 2024/04/04.
//

import SwiftUI

struct ResultView: View {
    let height: Double
    let weight: Double
    
    var body: some View {
        let bmi = calculateBMI()
        let bmiCategory = calcBmiCategory(bmi)
            return VStack {
                Text("키: \(String(format: "%.1f", Double(height))) cm / 몸무게: \(String(format: "%.1f", Double(weight))) kg")
                    .padding()
                
                Text("BMI: \(String(format: "%.2f", bmi))")
                    .padding()
                    
                Text("비만도: \(bmiCategory)")
                    .padding()
                    
                }
            }
    
    private func calculateBMI() -> Double {
        let heightInMeters = height / 100
        return weight / (heightInMeters * heightInMeters)
    }
    
    private func calcBmiCategory(_ bmi: Double) -> String {
            var result = "저체중"

            if bmi >= 35 {
                result = "고도 비만"
            } else if bmi >= 30 {
                result = "2단계 비만"
            } else if bmi >= 25 {
                result = "1단계 비만"
            } else if bmi >= 23 {
                result = "과체중"
            } else if bmi >= 18.5 {
                result = "정상"
            }
            
            return result
        }
}

#Preview {
    ResultView(height: 0, weight: 0)
}
