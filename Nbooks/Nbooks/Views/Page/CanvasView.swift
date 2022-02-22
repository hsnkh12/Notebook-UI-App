//
//  CanvasSketchView.swift
//  MyNotebooks
//
//  Created by Hassan El Abdakkah on 01/11/2021.
//

import SwiftUI
import PencilKit
import RichEditorView


struct CanvasView: UIViewRepresentable {
    
    @Binding var canvasView: PKCanvasView
    @State var toolPicker = PKToolPicker()
    @Binding var drawing : Bool
    
    func makeUIView(context: Context) -> PKCanvasView {
        
        showToolPicker()
        canvasView.drawingPolicy = .anyInput
        return canvasView
    }
    
    func showToolPicker() {
      // 1
      toolPicker.setVisible(drawing, forFirstResponder: canvasView)
      // 2
      toolPicker.addObserver(canvasView)
      // 3
      canvasView.becomeFirstResponder()
    }

    
    func updateUIView(_ canvasView: PKCanvasView, context: Context) { }
}


