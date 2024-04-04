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
    @State private var isInvalidInput: Bool = false // 입력이 잘못되었는지를 나타내는 상태 변수
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("키 (cm)", text: $height)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.decimalPad) // 숫자 입력용 키보드 사용
                
                TextField("몸무게 (kg)", text: $weight)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.decimalPad) // 숫자 입력용 키보드 사용
                
                Button(action: {
                    if (Double(height) != nil), (Double(weight) != nil) {
                        isShowingResult = true
                        isInvalidInput = false // 유효한 입력이 있을 때는 스낵바를 표시하지 않도록 설정
                    } else {
                        isInvalidInput = true // 유효하지 않은 입력일 때 스낵바를 표시
                    }
                }) {
                    Text("BMI 계산")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .sheet(isPresented: $isShowingResult, content: {
                    ResultView(height: Double(height) ?? 0, weight: Double(weight) ?? 0)
                })
                .alert(isPresented: $isInvalidInput) {
                    Alert(title: Text("유효하지 않은 값"), message: Text("올바른 값을 입력하세요."), dismissButton: .default(Text("확인")))
                }
                
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
