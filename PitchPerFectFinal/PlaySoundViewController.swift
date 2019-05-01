//
//  PlaySoundViewController.swift
//  PitchPerFectFinal
//
//  Created by victor ay on 01/05/2019.
//  Copyright © 2019 victor ay. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundViewController: UIViewController {
    
    var recordedAudioURL: URL!
    
    @IBOutlet weak var snailButton: UIButton!
    @IBOutlet weak var chipmunkButton: UIButton!
    @IBOutlet weak var rabbitButton: UIButton!
    @IBOutlet weak var vaderButton: UIButton!
    @IBOutlet weak var echoButton: UIButton!
    @IBOutlet weak var reverbButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    var audioFile: AVAudioFile!
    var audioEngine: AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var stopTimer: Timer!
    
    enum ButtonType: Int {
        case slow = 0, fast, chipmunk, vader, echo, reverb
    }
    
    @IBAction func playSoundForButton(_ sender: UIButton) {
        switch(ButtonType(rawValue: sender.tag)!) {
        case .slow:
            playSound(rate: 0.55)
        case .fast:
            playSound(rate: 1.45)
        case .chipmunk:
            playSound(pitch: 1000)
        case .vader:
            playSound(pitch: -1000)
        case .echo:
            playSound(echo: true)
        case .reverb:
            playSound(reverb: true)
        }
        
        configureUI(.playing)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setContentMode(.scaleAspectFit)
        configureUI(.notPlaying)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAudio()
        
    }
    
    
    @IBAction func stopButtonPressed(_ sender: AnyObject) {
        stopAudio()
    }
    
    //MARK: UI fix for Landscape Mode
    
    func setContentMode(_ aspectFit: UIView.ContentMode){
        
        snailButton.imageView?.contentMode = aspectFit
        chipmunkButton.imageView?.contentMode = aspectFit
        rabbitButton.imageView?.contentMode = aspectFit
        vaderButton.imageView?.contentMode = aspectFit
        echoButton.imageView?.contentMode = aspectFit
        reverbButton.imageView?.contentMode = aspectFit
    }

}
