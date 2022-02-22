//
//  NotebookView.swift
//  MyNotebooks
//
//  Created by Hassan El Abdakkah on 25/10/2021.
//

import SwiftUI

struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}


extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}

struct NotebookView: View {
    
    @State var title : String
    @State var bgColor : String = "#3D5C8D"
    
    var body: some View {
        
        
        VStack{
            Text("")
            .frame(width: 150 , height:180)
            .background(Color(hex: bgColor))
            .cornerRadius(12,corners: [.topRight,.bottomRight])
            
            Text(title)
            
        }
        
        
    }
}


