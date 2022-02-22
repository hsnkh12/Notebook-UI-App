//
//  MainHomeView.swift
//  MyNotebooks
//
//  Created by Hassan El Abdakkah on 24/10/2021.
//

import SwiftUI



struct MainHomeView: View {
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        ]
    
    @State private var showSheet = false

    
    var body: some View {
        
            
            
            NavigationView{
                
            
                ZStack{
                    
                    ColorView(hex1: "#000000",hex2: "#1e3163")
                    
                        
                        ScrollView{
                        
                            Spacer().frame(height: 30)
                            
                            LazyVGrid(columns: columns, spacing: 20){
                                
                                
                                
                                
                                ForEach( 0..<2 ){_ in
                                    
                        
                                    NavigationLink(destination: MainPagesView()){
                                        
                                        NotebookView(title: "Notebook",bgColor: "#3D5C8D")
                                            
                                        
                                    }
                                            
                                        
                                        
                                    }
                                            
                            }.padding(.horizontal)
                                        
                        

                        }
                        
                    .navigationBarTitle(Text("My Nbooks"))
                    .navigationBarItems(trailing:
                                            
                    Button(action: {
                        
                        showSheet.toggle()
                        
                    }, label: {
                        Image(systemName: "plus")
                    }).sheet(isPresented: $showSheet){
                        NotebookCreateView()
                        }
                    
                    
                    )
                }.foregroundColor(.white)
                
            }
                        
                    
                
                
            }
        
       
        
    
}

struct MainHomeView_Previews:

    PreviewProvider {
    static var previews: some View {
        MainHomeView()
    }
}
