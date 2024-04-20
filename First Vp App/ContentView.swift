//
//  ContentView.swift
//  First Vp App
//
//  Created by admin on 4/17/24.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    @Environment(\.openImmersiveSpace) var openImmersiveSpace
    @Environment(\.dismissImmersiveSpace) var dismissImmersiveSpace

    var body: some View {
        VStack {
            Text("🎲")
                .foregroundStyle(.blue)
                .font(.custom("Menlo", size: 100))
                .bold()
        }
        .task {
            await openImmersiveSpace(id: "ImmersiveSpace")
        }
    }
}

#Preview(windowStyle: .volumetric) {
    ContentView()
}
