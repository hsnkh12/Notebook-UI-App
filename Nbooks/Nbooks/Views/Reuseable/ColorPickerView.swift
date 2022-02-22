//
//  ColorPickerView.swift
//  MyNotebooks
//
//  Created by Hassan El Abdakkah on 25/10/2021.
//

import SwiftUI

struct MyColorPickerView: View {
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
 
        ]
    
    let colors = ["#3D5C8D","#C37B89","#D1E8E4","#EAE7C6","#74C7B8","#FFCDA3","#FF75A0","#FFE699","#C67ACE","#70AF85"]
    
    @Binding var bgColor : String
    
    var body: some View {
        
        LazyVGrid(columns: columns, spacing: 18){
            
            ForEach(colors, id: \.self){ clr in
                
                Button(action:{
                    
                    bgColor = clr
                }){
                Circle()
                    .foregroundColor(Color(hex: clr))
                    .frame(width: 40 , height: 40)
                }}
        }.padding(.all)
    }
}


