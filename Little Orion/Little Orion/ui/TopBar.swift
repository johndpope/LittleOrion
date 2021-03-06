//
//  TopBar.swift
//  Little Orion
//
//  Created by Thomas Ricouard on 21/01/2017.
//  Copyright © 2017 Thomas Ricouard. All rights reserved.
//

import UIKit
import ReSwift

class TopBar: BaseUI {

    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var playButton: UIButton!
    @IBOutlet var speedButton: UIButton!
    
    @IBOutlet var energyIcon: UIImageView!
    @IBOutlet var energyLabel: UILabel!

    @IBOutlet var mineralIcon: UIImageView!
    @IBOutlet var mineralLabel: UILabel!

    @IBOutlet var scienceIcon: UIImageView!
    @IBOutlet var scienceLabel: UILabel!

    public static func loadFromNib() -> TopBar {
        let nib = UINib(nibName: "TopBar", bundle: Bundle.main)
        return nib.instantiate(withOwner: self, options: nil)[0] as! TopBar
    }

    override func didMoveToSuperview() {
        super.didMoveToSuperview()

        layer.cornerRadius = 0

        store.subscribe(self) {
            $0.select{ $0.playerState }.skipRepeats()
        }
    }

    @IBAction func onPlayButton(_ sender: Any) {
        if store.state.playerState.isPlaying {
            store.dispatch(PlayerActions.PauseTimer())
        }
        else {
            store.dispatch(PlayerActions.StartTimer())
        }
    }
    
    @IBAction func onSpeedButton(_ sender: Any) {
        store.dispatch(PlayerActions.UpdateSpeed(speed: store.state.playerState.currentSpeed.nextValue()))
    }
}

extension TopBar: StoreSubscriber {
    func newState(state: PlayerState) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        dateLabel.text = dateFormatter.string(from: state.currentDate)
        playButton.setTitle(state.isPlaying ? "||" : ">", for: .normal)
        speedButton.setTitle("x\(state.currentSpeed.displayValue())", for: .normal)
        energyLabel.text = "\(state.player.resources.energy.value)"
        mineralLabel.text = "\(state.player.resources.minerals.value)"
        scienceLabel.text = "\(state.player.resources.science.value)"
    }
}
