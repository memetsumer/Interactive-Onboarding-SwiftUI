//
//  ParticleSystem.swift
//  Instagram
//
//  Created by Mehmet Sümer on 23.12.2022.
//

import Foundation
import SwiftUI

class ParticleSystem {
    var particles = Set<Particle>()
    var center = UnitPoint.center
    
    func update (date: TimeInterval) {
        let newParticle = Particle(x: center.x, y: center.y)
        
        particles.insert(newParticle)
    }
}
