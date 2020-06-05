//
//  ContentView.swift
//  CalculatorApp
//
//  Created by Harshit Gajjar on 5/16/20.
//  Copyright © 2020 ThinkX. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var calculation = ""
    @State var result = ""
    var body: some View {
        ZStack(alignment: .bottom) {
            Color(red: 0.10,green: 0.11,blue:0.16)
            .edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .trailing)  {
                
                HStack(spacing: UIScreen.main.bounds.width/2){
//                    if(result != ""){
//                        ShowText(text: "=")
//
//                    }
                    ShowText(text: result)
                    }.padding()
                
                VStack(alignment: .trailing) {
                    ShowText(text: calculation)
                }.padding()
    
                
                HStack{
                    VStack{
                        HStack{
                            ColouredButton(btnarr: ["CE", "+/-", "%"], calculation: $calculation, result: $result)
                        }
                        SimpleButton(btnarr: ["7", "8", "9"], calculation: $calculation, result: $result)
                        SimpleButton(btnarr: ["4", "5", "6"], calculation: $calculation, result: $result)
                        SimpleButton(btnarr: ["1", "2", "3"], calculation: $calculation, result: $result)
                        SimpleButton(btnarr: ["0", ".", "="], calculation: $calculation, result: $result)
                    }
                    
                    VStack{
                        ColouredButton(btnarr: ["/", "*", "-"], calculation: $calculation, result: $result)
                        
                        
                        Button(action: {
                            self.calculation = self.calculation + "+"
                        }) {
                            RoundedRectangle(cornerRadius: 15, style: .continuous)
                            .fill(Color(red: 0.32, green: 0.79, blue: 0.86))
                            .frame(width: 70, height: 145)
                            .overlay(
                                Text("+")
                                    .foregroundColor(.white)
                                    .font(.system(size: 28))
                                    .fontWeight(.heavy))
                        }

                    }
                }.padding(.horizontal, 10)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            ContentView()
            .previewDevice(PreviewDevice(rawValue: "iPhone X"))
                .previewDisplayName("iphone x")

            ContentView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 11 Pro Max"))
                .previewDisplayName("iphone 11 pro max")
            
            ContentView()
            .previewDevice(PreviewDevice(rawValue: "iPhone SE"))
            .previewDisplayName("iphone SE")

            ContentView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 8 Plus"))
            .previewDisplayName("iphone 8 plus")
        }
    }
}

struct ColouredButton: View {
    var btnarr: [String]
    @Binding var calculation: String
    @Binding var result: String
    var body: some View {
       
            ForEach(btnarr, id: \.self) { element in
                Button(action: {
                    if(element == "CE"){
                        self.calculation = ""
                        self.result = ""
                    }else{
                        self.calculation += element
                    }
                }) {
                    RoundedRectangle(cornerRadius: 15, style: .continuous)
                        .fill(Color(red: 0.32, green: 0.79, blue: 0.86))
                        .frame(width: 70, height: 70)
                        .overlay(
                            Text(element)
                                .foregroundColor(.white)
                                .font(.system(size: 28))
                                .fontWeight(.heavy))
                }.padding(.horizontal, 10)
            }
    }
}


struct SimpleButton: View {
    var btnarr: [String]
    @Binding var calculation: String
    @Binding var result: String
    var body: some View {
        HStack{
            ForEach(btnarr, id: \.self) { element in
                Button(action: {
                    if(element == "="){
                        let mathExpression = NSExpression(format: self.calculation)
                        let mathValue = mathExpression.expressionValue(with: nil, context: nil) as? Int
                        self.result = "= \(mathValue!)"
                        self.calculation = ""
                    }else{
                        self.calculation += element
                    }

                }) {
                    RoundedRectangle(cornerRadius: 15, style: .continuous)
                        .fill(Color(red: 0.20, green: 0.29, blue: 0.37))
                        .frame(width: 70, height: 70)
                        .overlay(
                            Text(element)
                                .foregroundColor(.white)
                                .font(.system(size: 28))
                                .fontWeight(.heavy))
                }.padding(.horizontal, 10)
            }
        }
    }
}

