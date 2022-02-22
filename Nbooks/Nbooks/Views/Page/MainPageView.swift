//
//  MainNotebookView.swift
//  MyNotebooks
//
//  Created by Hassan El Abdakkah on 24/10/2021.
//

import SwiftUI

class EditorProps : ObservableObject {
    
    @Published var htmlText : String = """
                <style>
                    #editor{
                        margin: 10px;
                        color: black;
                        font-size: 18px;
            
                    }
                </style>

            """
    @Published var isWriting : Bool = false
    @Published var focus : Bool = false
}



struct MainPageView: View {
    
    @StateObject var editorProps = EditorProps()
    @State private var title = "Untitled"
    @Environment(\.colorScheme) var colorScheme
    
    
    var body: some View {
        
            
                    // Body ( editor )
        
                VStack{
                    
                    
                        
                    RichTextEditorView(editorProps: editorProps)
//                        .padding([.leading,.top,.trailing])
                        

                }
                .navigationBarItems(trailing:
                
                                    
                        Button(action: {
                            
                                if editorProps.isWriting {
                                    editorProps.focus = false
                                }
                    
                        },
                        label: {
                            
                            if editorProps.focus == false {
                                    Image(systemName: "ellipsis.circle")
                            }
                            else{
                                Text("Done")
                            }
                                
                        })
                                    
                    )
                        
                
                
                .navigationBarTitleDisplayMode(.inline)
                        .toolbar {
                            ToolbarItem(placement: .principal) {
                                
                                TextField("",text: $title).frame(width: 140,alignment: .center).multilineTextAlignment(.center)
                                    
                                
                                
                            }
                        }
               
               .foregroundColor(
                    colorScheme == .dark ? Color.white : Color.black)
                        
            
            }
        
    
}


struct BeforeMainPageView : View {
    
    @StateObject var editorProps = EditorProps()
    
    var body : some View {
        
        MainPageView(editorProps: editorProps)
    }
}



