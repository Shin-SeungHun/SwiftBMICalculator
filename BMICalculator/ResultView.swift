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
        return Text("BMI: \(String(format: "%.2f", bmi))")
            .padding()
    }
    
    func calculateBMI() -> Double {
        let heightInMeters = height / 100
        return weight / (heightInMeters * heightInMeters)
    }
}

#Preview {
    ResultView(height: 0, weight: 0)
}
