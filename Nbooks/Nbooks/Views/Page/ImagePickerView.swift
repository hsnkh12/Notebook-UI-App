//
//  ImagePickerView.swift
//  MyNotebooks
//
//  Created by Hassan El Abdakkah on 02/11/2021.
//

import SwiftUI

struct ImagePickerView: UIViewControllerRepresentable {

    @Binding var selectedImage: UIImage?
    @ObservedObject var editorProps : EditorProps
    
    @Environment(\.presentationMode) var isPresented
    var sourceType: UIImagePickerController.SourceType
    
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        var picker: ImagePickerView
        
        init(picker: ImagePickerView) {
            self.picker = picker
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            guard let selectedImage = info[.originalImage] as? UIImage else { return }
            self.picker.selectedImage = selectedImage
            
            self.picker.editorProps.htmlText = "Image Picked"
            //"\(Image(uiImage: selectedImage))"
            
            self.picker.isPresented.wrappedValue.dismiss()
        }
        
    }
        
    func makeUIViewController(context: Context) -> UIImagePickerController {
            let imagePicker = UIImagePickerController()
            imagePicker.sourceType = self.sourceType
            imagePicker.delegate = context.coordinator // confirming the delegate
            return imagePicker
        }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {

    }
    
    func makeCoordinator() -> Coordinator {
            return Coordinator(picker: self)
        }
}
