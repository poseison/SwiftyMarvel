//
//  SwiftUiMarvelApp.swift
//  SwiftUiMarvel
//
//  Created by Charilaos Laliotis on 17/7/23.
//

import SwiftUI

@main
struct SwiftUiMarvelApp: App {
    init() {
        
         Resolver.shared.injectModules()
     }
     
     var body: some Scene {
         WindowGroup {
             SplashView()
         }
     }
}
