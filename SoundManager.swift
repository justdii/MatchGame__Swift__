//
//  SoundManager.swift
//  Match  App
//
//  Created by Diana on 3/13/19.
//  Copyright © 2019 Diana. All rights reserved.
//

import Foundation
import AVFoundation

class SoundManager {
    
    static var audioPlayer:AVAudioPlayer?
    
    enum SoundEffect{
        
        case flip
        case shuffle
        case match
        case nomatch
    }
    
    static func playSound(effect:SoundEffect){
        
        var soundFilename = ""
        
        switch effect{
            
        case .flip:
            soundFilename = "cardflip"
        
        case .shuffle:
            soundFilename = "shuffle"
            
        case .match:
            soundFilename = "dingcorrect"
            
        case .nomatch:
            soundFilename = "dingwrong"
        }
        
        let bundlePath = Bundle.main.path(forResource: soundFilename, ofType: "wav")
        
        guard bundlePath != nil else{
            print("Cant find file \(soundFilename)")
            return
        }
        
        let soundURL = URL(fileURLWithPath: bundlePath!)
        
        do {
            
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
            
            audioPlayer?.play()
        }
        catch{
            print("error for file \(soundFilename)")
        }
    }
}

