//
//  RichTextEditorView.swift
//  MyNotebooks
//
//  Created by Hassan El Abdakkah on 02/11/2021.
//

import SwiftUI
import RichEditorView



let focusScript = "document.getElementById('editor').focus();"


let lostFocusScript = "document.getElementById('editor').blur();"


struct RichTextEditorView: UIViewRepresentable {
    
    @ObservedObject var editorProps : EditorProps
    @Environment(\.colorScheme) var colorScheme
    @State var toolbar = RichEditorToolbar(frame: CGRect(x: 0, y: 0, width: 100, height: 44))
  
  class Coordinator: RichEditorDelegate {
    
    var parent: RichTextEditorView
    
    init(_ parent: RichTextEditorView) {
      self.parent = parent
    }
    
    func richEditorTookFocus(_ editor: RichEditorView) {
        parent.editorProps.focus = true

    }
    
    func richEditorLostFocus(_ editor: RichEditorView) {
        parent.editorProps.focus = false

    }
    
      // this method will be called in 2 conditions 1- on apeare 2- every letter we write
    func richEditor(_ editor: RichEditorView, contentDidChange content: String) {
        
        parent.editorProps.htmlText = content
        

        
    }
    
  }
  
  func makeCoordinator() -> Coordinator {
    Coordinator(self)
  }
  

  
  func makeUIView(context: Context) -> RichEditorView {
      
      let editor = RichEditorView()
      editor.html = editorProps.htmlText
      
      editor.isScrollEnabled = true
      
      editor.webView.isOpaque = false
      editor.webView.backgroundColor = UIColor(Color(hex: "#E8E1D9"))
      editor.delegate = context.coordinator
      
      if colorScheme == .dark{
          toolbar.backgroundColor = UIColor(Color.black.opacity(0.1))
          toolbar.tintColor = UIColor(Color.white)
      }
      else{
          toolbar.backgroundColor = UIColor(Color.white)
          toolbar.tintColor = UIColor(Color.black)
          
      }
      toolbar.options = RichEditorDefaultOption.all
      toolbar.editor = editor

    
    return editor
  }
  
  func updateUIView(_ uiView: RichEditorView, context: Context)  {
      
      let isWriting = editorProps.isWriting
      let focus = editorProps.focus
      
      if isWriting == true && focus == false{
          
          uiView.runJS(lostFocusScript)
          uiView.inputAccessoryView = nil
          editorProps.isWriting = false
      }
      else if isWriting == false && focus == true {
         
          uiView.inputAccessoryView = toolbar
          editorProps.isWriting = true
      }
          
          
  }
}

