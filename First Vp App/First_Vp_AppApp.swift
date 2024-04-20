//
//  First_Vp_AppApp.swift
//  First Vp App
//
//  Created by admin on 4/17/24.
//

import SwiftUI

@main
struct First_Vp_AppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }.defaultSize(width: 100, height: 100)

        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView()
        }
    }
}
