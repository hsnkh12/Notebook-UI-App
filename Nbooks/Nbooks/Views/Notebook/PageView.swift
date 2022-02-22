//
//  PageView.swift
//  MyNotebooks
//
//  Created by Hassan El Abdakkah on 26/10/2021.
//

import SwiftUI

struct PageView: View {
    
    
    @State var title : String = "Untitled"
    @State var bgColor : String
    @State var chapter : String?
    
    
    var body: some View {
        VStack(spacing: 0){
            Text("")
            .frame(width: 145 , height:160)
            .background(Color(hex: bgColor))
            
            VStack{
                Text(title)
                
            }.frame(width: 146,height: 30).background(Color.black.opacity(0.3))
            
            
        }.cornerRadius(8)
    }
}

