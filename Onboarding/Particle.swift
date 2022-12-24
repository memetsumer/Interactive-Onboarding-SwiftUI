//
//  Particle.swift
//  Instagram
//
//  Created by Mehmet Sümer on 23.12.2022.
//

import Foundation

struct Particle: Hashable {
    let x: Double
    let y: Double
    let creationDate = Date.now.timeIntervalSinceReferenceDate
}
