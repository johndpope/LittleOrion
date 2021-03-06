//
//  Player.swift
//  Little Orion
//
//  Created by Thomas Ricouard on 22/01/2017.
//  Copyright © 2017 Thomas Ricouard. All rights reserved.
//

import Foundation
import GameplayKit

class Player: GKEntity, GKGameModelPlayer {
    let name: String

    public var playerId: Int {
        get {
            return name.hashValue
        }
    }
    
    var resources = PlayerResources()

    var visitedPlanets: [PlanetId] = []
    var ownedPlanets: [PlanetId] = []

    var spriteNode: SKNode {
        get {
            return component(ofType: PlayerSpriteComponent.self)!.node
        }
    }

    var position = CGPoint.zero {
        didSet {
            spriteNode.position = position
        }
    }

    init(name: String) {
        self.name = name
        super.init()

        addComponent(PlayerSpriteComponent())
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

func ==(lhs: Player, rhs: Player) -> Bool {
    return lhs.name == rhs.name &&
        rhs.visitedPlanets == lhs.visitedPlanets &&
        rhs.ownedPlanets == lhs.ownedPlanets &&
        rhs.resources == lhs.resources
}
