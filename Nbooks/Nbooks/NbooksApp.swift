//
//  NbooksApp.swift
//  Nbooks
//
//  Created by Hassan El Abdakkah on 08/11/2021.
//

import SwiftUI

@main

struct NbooksApp: App {
    init() {
            
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        UINavigationBar.appearance().barStyle = .black
        
        }
    var body: some Scene {
        WindowGroup {
            MainHomeView()
        }
    }
}
