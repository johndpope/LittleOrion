//
//  UIActions.swift
//  Little Orion
//
//  Created by Thomas Ricouard on 21/01/2017.
//  Copyright © 2017 Thomas Ricouard. All rights reserved.
//

import Foundation
import ReSwift

class UIActions {
    struct ShowSelectedSystemModal: Action {
        let system: SystemEntity
    }

    struct ShowPlanetDetail: Action {
        let planet: PlanetEntity
    }

    struct ShowUniverseScene: Action {

    }

    struct DismissSystemModal: Action {

    }
}
