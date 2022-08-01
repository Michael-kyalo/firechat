//
//  firechatApp.swift
//  firechat
//
//  Created by rt on 01/08/2022.
//

import SwiftUI
import Firebase

@main
struct firechatApp: App {
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
