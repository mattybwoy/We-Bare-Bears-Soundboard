//
//  ViewController.swift
//  We Bare Bears SoundBoard
//
//  Created by Matthew Lock on 22/07/2021.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer!
    let grizzSounds: [String] = []
    let panpanSounds: [String] = []
    let iceSounds: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        var soundWave = sender.currentTitle!
        
        if soundWave == "GrizzButton" {
            soundWave = "Grizz1"
        } else if soundWave == "PanpanButton" {
            soundWave = "Panpan1"
        } else if soundWave == "IceBearButton" {
            soundWave = "Icebear1"
        } else {
            soundWave = "ThemeSong"
        }
        
        playSound(soundName: soundWave)
        // sets opacity to half - you can change the opacity by editing "0.5"
        sender.alpha = 0.5
        /*
        Code should execute after 0.2 second delay.
        You can change delay by editing 0.2.
        */
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
          // Bring's sender's opacity back up to fully opaque
          sender.alpha = 1.0
        }
    }
    
    func playSound(soundName: String) {
        let url = Bundle.main.url(forResource: soundName, withExtension: "m4a")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
                
    }
}

