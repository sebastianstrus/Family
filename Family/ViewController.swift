//
//  ViewController.swift
//  Family
//
//  Created by Sebastian Strus on 2018-01-13.
//  Copyright © 2018 Sebastian Strus. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer?
    
    var backgroundMusic: AVAudioPlayer?

    @IBOutlet weak var mamaBtn: RoundButton!
    @IBOutlet weak var tataBtn: RoundButton!
    @IBOutlet weak var juliaBtn: RoundButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //playSound(sound: "jagodki", infinity: true)
        
        guard let url = Bundle.main.url(forResource: "jagodki", withExtension: "mp3") else { return }
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            try AVAudioSession.sharedInstance().setActive(true)
            /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
            backgroundMusic = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            /* iOS 10 and earlier require the following line:
             player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */
            guard let backgroundMusic = backgroundMusic else { return }
            backgroundMusic.numberOfLoops = -1
            backgroundMusic.volume = 0.3
            backgroundMusic.play()
        } catch let error {
            print(error.localizedDescription)
        }
        
        
        
        
        
        mamaBtn.clipsToBounds = true
        tataBtn.clipsToBounds = true
        juliaBtn.clipsToBounds = true
    }

    
    @IBAction func mamaPressed(_ sender: Any) {
        playSound(sound: "mama", infinity: false)
    }
    
    @IBAction func tataPressed(_ sender: Any) {
        playSound(sound: "tata", infinity: false)
    }
    
    @IBAction func juliaPressed(_ sender: Any) {
        playSound(sound: "julia", infinity: false)
    }
    
    
    
    func playSound(sound: String, infinity: Bool) {
        guard let url = Bundle.main.url(forResource: sound, withExtension: "mp3") else { return }
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            try AVAudioSession.sharedInstance().setActive(true)
            /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            /* iOS 10 and earlier require the following line:
             player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */
            guard let player = player else { return }
            if (infinity == true) {
                player.numberOfLoops = -1
                player.volume = 0.3
            }
            player.play()
        } catch let error {
            print(error.localizedDescription)
        }
    }
}

