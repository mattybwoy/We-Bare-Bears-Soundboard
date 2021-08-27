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
    let grizzSounds = ["Grizz1", "Grizz2", "Grizz3"]
    let panpanSounds = ["Panpan1", "Panpan2", "Panpan3"]
    let iceSounds = ["Icebear1", "Icebear2", "Icebear3"]
    var soundWave: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        
        guard let song = sender.currentTitle else { return  }
        
        if song == "GrizzButton" {
            soundWave = grizzSounds.randomElement()
        } else if song == "PanpanButton" {
            soundWave = panpanSounds.randomElement()
        } else if song == "IceBearButton" {
            soundWave = iceSounds.randomElement()
        } else {
            soundWave = "ThemeSong"
        }
        
        guard let soundWave = soundWave else { return }
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

