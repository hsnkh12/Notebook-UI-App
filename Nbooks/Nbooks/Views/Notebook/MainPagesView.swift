//
//  MainPageView.swift
//  MyNotebooks
//
//  Created by Hassan El Abdakkah on 24/10/2021.
//

import SwiftUI




struct MainPagesView: View {
    
    let columns = [
        
        GridItem(.flexible()),
        GridItem(.flexible()),
        ]


    
    
    var body: some View {
            
        
            ZStack{
                
                ColorView(hex1: "#000000",hex2: "#1e3163")
                
                    
                ScrollView{
                
                    
                    VStack(){
                        LazyVGrid(columns: columns){


                            // Pages
                            
                            ForEach(0..<2){ page in
                                NavigationLink(destination: MainPageView()){
                                PageView(title: "Untitles", bgColor: "#E8E1D9" )
                                }
                            }




                        }.padding(.horizontal)
                    }.padding(.all)
                    
                    // Chapters holders
                    
                    VStack(spacing: -8){
                    
                        ForEach(0..<2){ chapter in

                            VStack(alignment: .leading){

                                Text("Chapter \(chapter + 1)").font(.title).padding(.all).foregroundColor(Color.white.opacity(0.6))
                                Spacer().frame(height:25)

                                LazyVGrid(columns: columns){

                                        // Pages
                                    
                                    ForEach(0..<2){ page in
                                        
                                        PageView(title: "Untitles", bgColor: "#E8E1D9" )
                                        
                                    }

                                    

                                }.padding(.horizontal)

                                Spacer().frame(height:15)



                            }.frame(minWidth: 350,minHeight: 310).background(Color(hex: "#212121").opacity(0.3)).cornerRadius(15).padding(.all)

                        }
                    }
                    
                    
                }
                
                
                
            }
            .navigationTitle("Notebook")
            .navigationBarItems(trailing:
                                    
            Button(action: {

                
            }, label: {
                Image(systemName: "plus")
            })
            
            
            )
            .foregroundColor(.white)
            
        
    }
}

struct MainPageView_Previews: PreviewProvider {
    static var previews: some View {
        MainPagesView()
        
    }
}

