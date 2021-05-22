//
//  ViewController.swift
//  Xylophone
//
//  Created by Masood Zafar on 05.02.2021.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        playSound(soundName: sender.currentTitle!)
        sender.backgroundColor = #colorLiteral(red: 0.9607843137, green: 0.7058823529, blue: 0.3803921569, alpha: 1)
        
        //Code will execute after 0.2 second delay and will bring's sender's background color back up
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            sender.backgroundColor = #colorLiteral(red: 0.9529411765, green: 0.9176470588, blue: 0.7607843137, alpha: 1)
          }
    }
    
    func playSound(soundName: String) {
        
        guard let url = Bundle.main.url(forResource: soundName, withExtension: "wav")
        else
        {
            print("Error getting url!")
            return
            
        }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.wav.rawValue)
            guard let player = player else { return }
            
            player.play()
        }
        catch let error {
           print(error.localizedDescription)
            
        }

    }
}
