//
//  NotebookCreateView.swift
//  MyNotebooks
//
//  Created by Hassan El Abdakkah on 25/10/2021.
//

import SwiftUI


class NotebookForm : ObservableObject{
    
    @Published var title : String = ""
    @Published var bgColor : String = "#3D5C8D"
}



struct NotebookCreateView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    
    init(){
        
        UITableView.appearance().backgroundColor = .clear
        
    }
    
    @ObservedObject var nForm = NotebookForm()
    
    
    var body: some View {
            
            
            ZStack{
                
                ColorView(hex1: "#0b193b",hex2: "#000000")
                
                VStack{
                    
                    
                        Spacer().frame(height: 165)
                        
                        VStack{
                                Text("")
                                .frame(width: 180 , height:210)
                                .background(Color(hex: nForm.bgColor))
                                .cornerRadius(12,corners: [.topRight,.bottomRight])
                                
                            TextField("Notebook...", text: $nForm.title)
                                .textFieldStyle(PlainTextFieldStyle())
                                .font(.title)
                                .multilineTextAlignment(.center)
                                
                        }
                        
                        Spacer().frame(height:40)
                        
                        MyColorPickerView(bgColor: $nForm.bgColor)
                        
                        Spacer().frame(height:30)
                        
                        Button(action:{
                            presentationMode.wrappedValue.dismiss()
                        }){
                            Image(systemName: "pencil").foregroundColor(Color.white.opacity(0.9))
                            Text("Let's write!").font(.title2).foregroundColor(Color.white.opacity(0.9))
                            
                            
                        }.frame(width: 270, height: 53).overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color(hex: nForm.bgColor).opacity(0.5), lineWidth: 1)
                        )
                                
                        
                        Spacer().frame(height:165)
                    
                    
                    
                    
                    

                    }
 
            }
        

                
            
        
    }
}


