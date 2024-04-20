//
//  ImmersiveView.swift
//  First Vp App
//
//  Created by admin on 4/17/24.
//

import RealityKit
import RealityKitContent
import SwiftUI

struct ImmersiveView: View {
    var body: some View {
        RealityView { content in
            let floor = ModelEntity(mesh: .generatePlane(width: 50, depth: 50), materials: [OcclusionMaterial()])
            floor.generateCollisionShapes(recursive: false)
            floor.components[PhysicsBodyComponent.self] = .init(
                massProperties: .default,
                mode: .static
            )
            content.add(floor)
            
            
            if let diceModel = try? await Entity(named: "dice"),
               let dice = diceModel.children.first?.children.first
            {
                dice.scale = [0.1, 0.1, 0.1]
                dice.position.y = 0.5
                dice.position.z = -1

                dice.generateCollisionShapes(recursive: false)
                dice.components.set(InputTargetComponent())

                dice.components[PhysicsBodyComponent.self] = .init(PhysicsBodyComponent(
                    massProperties: .default,
                    material: .generate(staticFriction: 0.8, dynamicFriction: 0.5, restitution: 0.1),
                    mode: .dynamic
                ))
                dice.components[PhysicsMotionComponent.self] = .init()

                content.add(dice)
            }
        }
    }
}

#Preview(immersionStyle: .mixed) {
    ImmersiveView().previewLayout(.sizeThatFits)
}
